using System;
using System.Data.SqlClient;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ProyectFinal2
{
    class Program
    {
        static string apiKey = ""; 
        static string modelo = "llama3-70b-8192"; 
        static string cadenaConexion = "Server=Mario\\SQLEXPRESS;Database=GanadoAI;Trusted_Connection=True;";

        static async Task Main(string[] args)
        {
            string opcion;
            do
            {
                Console.Clear();
                Console.WriteLine("= Asistente Virtual Inteligente Para Productores De Ganado Del Departamento De Jutiapa =");
                Console.WriteLine("1. Hacer una consulta");
                Console.WriteLine("2. Ver historial");
                Console.WriteLine("3. Exportar historial");
                Console.WriteLine("4. Ver estadísticas");
                Console.WriteLine("5. Salir");
                Console.Write("Opción: ");
                opcion = Console.ReadLine();

                switch (opcion)
                {
                    case "1":
                        await HacerConsulta();
                        break;
                    case "2":
                        VerHistorial();
                        break;
                    case "3":
                        ExportarHistorial();
                        break;
                    case "4":
                        VerEstadisticas();
                        break;
                    case "5":
                        Console.WriteLine("¡Gracias por usar GANADO AI!");
                        break;
                    default:
                        Console.WriteLine("Opción inválida.");
                        break;
                }

                if (opcion != "5")
                {
                    Console.WriteLine("\nPresione ENTER para continuar...");
                    Console.ReadLine();
                }

            } while (opcion != "5");
        }

        static async Task HacerConsulta()
        {
            Console.WriteLine("\nCategorías:");
            Console.WriteLine("1. Salud\n2. Alimentación\n3. Reproducción\n4. Otra");
            Console.Write("Ingrese el número de categoría: ");
            string seleccion = Console.ReadLine();

            string categoria = seleccion switch
            {
                "1" => "Salud",
                "2" => "Alimentación",
                "3" => "Reproducción",
                _ => "Otra"
            };

            Console.Write("Escriba su pregunta: ");
            string pregunta = Console.ReadLine();

            string prompt = $"Eres un veterinario especializado en ganadería. Responde con claridad. Categoría: {categoria}. Pregunta: {pregunta}";

            string respuesta = await ObtenerRespuesta(prompt);

            Console.WriteLine("\nRespuesta:");
            Console.WriteLine(respuesta);

            GuardarEnBD(categoria, pregunta, respuesta);
        }

        static async Task<string> ObtenerRespuesta(string texto)
        {
            using HttpClient cliente = new HttpClient();
            cliente.BaseAddress = new Uri("https://api.groq.com/openai/v1/");
            cliente.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", apiKey);

            var datos = new
            {
                model = modelo,
                messages = new[]
                {
                    new { role = "user", content = texto }
                }
            };

            string json = JsonConvert.SerializeObject(datos);
            var contenido = new StringContent(json, Encoding.UTF8, "application/json");
            var respuesta = await cliente.PostAsync("chat/completions", contenido);

            if (respuesta.IsSuccessStatusCode)
            {
                var resultado = JObject.Parse(await respuesta.Content.ReadAsStringAsync());
                return resultado["choices"][0]["message"]["content"].ToString().Trim();
            }
            else
            {
                return "Error al obtener respuesta de la IA.";
            }
        }

        static void GuardarEnBD(string categoria, string pregunta, string respuesta)
        {
            using SqlConnection conexion = new SqlConnection(cadenaConexion);
            string sql = "INSERT INTO ConsultasGanaderas (Categoria, Pregunta, Respuesta) VALUES (@categoria, @pregunta, @respuesta)";
            SqlCommand comando = new SqlCommand(sql, conexion);
            comando.Parameters.AddWithValue("@categoria", categoria);
            comando.Parameters.AddWithValue("@pregunta", pregunta);
            comando.Parameters.AddWithValue("@respuesta", respuesta);

            conexion.Open();
            comando.ExecuteNonQuery();
            conexion.Close();

            Console.WriteLine("✔ Consulta guardada.");
        }

        static void VerHistorial()
        {
            using SqlConnection conexion = new SqlConnection(cadenaConexion);
            string sql = "SELECT TOP 10 Categoria, Pregunta, Respuesta, FechaHora FROM ConsultasGanaderas ORDER BY FechaHora DESC";
            SqlCommand comando = new SqlCommand(sql, conexion);
            conexion.Open();
            var lector = comando.ExecuteReader();

            Console.WriteLine("\n--- Historial ---");
            while (lector.Read())
            {
                Console.WriteLine($"\n[{lector["FechaHora"]}] ({lector["Categoria"]})");
                Console.WriteLine("Pregunta: " + lector["Pregunta"]);
                Console.WriteLine("Respuesta: " + lector["Respuesta"]);
            }
            conexion.Close();
        }

        static void ExportarHistorial()
        {
            string ruta = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Historial_GanadoAI.csv");

            using StreamWriter archivo = new StreamWriter(ruta);
            using SqlConnection conexion = new SqlConnection(cadenaConexion);
            string sql = "SELECT Categoria, Pregunta, Respuesta, FechaHora FROM ConsultasGanaderas ORDER BY FechaHora DESC";
            SqlCommand comando = new SqlCommand(sql, conexion);
            conexion.Open();
            var lector = comando.ExecuteReader();

            archivo.WriteLine("Fecha,Categoria,Pregunta,Respuesta");

            while (lector.Read())
            {
                archivo.WriteLine($"\"{lector["FechaHora"]}\",\"{lector["Categoria"]}\",\"{lector["Pregunta"]}\",\"{lector["Respuesta"]}\"");
            }

            conexion.Close();
            Console.WriteLine("✔ Historial exportado al escritorio.");
        }

        static void VerEstadisticas()
        {
            using SqlConnection conexion = new SqlConnection(cadenaConexion);
            string sql = "SELECT Categoria, COUNT(*) AS Total FROM ConsultasGanaderas GROUP BY Categoria";
            SqlCommand comando = new SqlCommand(sql, conexion);
            conexion.Open();
            var lector = comando.ExecuteReader();

            Console.WriteLine("\n--- Estadísticas ---");
            while (lector.Read())
            {
                Console.WriteLine($"{lector["Categoria"]}: {lector["Total"]} consultas");
            }
            conexion.Close();
        }
    }
}