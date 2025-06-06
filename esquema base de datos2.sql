USE [master]
GO
/****** Object:  Database [GanadoAI]    Script Date: 30/05/2025 18:04:07 ******/
CREATE DATABASE [GanadoAI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GanadoAI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GanadoAI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GanadoAI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\GanadoAI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [GanadoAI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GanadoAI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GanadoAI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GanadoAI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GanadoAI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GanadoAI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GanadoAI] SET ARITHABORT OFF 
GO
ALTER DATABASE [GanadoAI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GanadoAI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GanadoAI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GanadoAI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GanadoAI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GanadoAI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GanadoAI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GanadoAI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GanadoAI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GanadoAI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GanadoAI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GanadoAI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GanadoAI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GanadoAI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GanadoAI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GanadoAI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GanadoAI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GanadoAI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GanadoAI] SET  MULTI_USER 
GO
ALTER DATABASE [GanadoAI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GanadoAI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GanadoAI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GanadoAI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GanadoAI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GanadoAI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [GanadoAI] SET QUERY_STORE = ON
GO
ALTER DATABASE [GanadoAI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [GanadoAI]
GO
/****** Object:  Table [dbo].[ConsultasGanaderas]    Script Date: 30/05/2025 18:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultasGanaderas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](50) NULL,
	[Pregunta] [nvarchar](max) NULL,
	[Respuesta] [nvarchar](max) NULL,
	[FechaHora] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ConsultasGanaderas] ON 

INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (1, N'Alimentación', N'cual es la mejor dieta para ganado lechero en epoca seca', N'Como veterinario experto en ganadería bovina, puedo afirmar que la elección de la dieta adecuada para el ganado lechero durante la época seca es crucial para mantener la producción láctea, la salud y el bienestar de los animales.

Durante la época seca, la disponibilidad de forrajes frescos y de alta calidad es limitada, lo que puede afectar la producción láctea y la condición corporal de los animales. Por lo tanto, es fundamental diseñar una dieta que sea capaz de proporcionar los nutrientes esenciales para la producción láctea y la mantención de la condición corporal.

A continuación, se presentan los componentes clave de una dieta adecuada para el ganado lechero durante la época seca**:

1. **Forrajes conservados**: De alta calidad, como heno o silaje de leguminosas (alfalfa, trifolio, etc.) o gramíneas (avena, cebada, etc.). Estos forrajes deben contener al menos un 15% de proteína bruta y un 30% de fibra bruta.
2. **Concentrados**: Que proporcionen energía y proteína adicional. Pueden ser mezclas de cereales (maíz, trigo, cebada), leguminosas (arveja, garbanzo, etc.) y otros ingredientes como vitaminas, minerales y aminoácidos.
3. **Energía adicional**: Se puede proporcionar a través de fuentes como el maíz, la melaza o el aceite de palma.
4. **Proteína bypass**: Que sea resistente a la degradación ruminal, como la proteína de soja tostada o de alfalfa tostada. Esto garantiza que una parte de la proteína llegue al intestino delgado, donde puede ser absorbida y utilizada para la síntesis de proteínas lácteas.
5. **Vitaminas y minerales**: Es esencial asegurarse de que la dieta contenga adecuadas cantidades de A, D, E y B, así como minerales como calcio, fósforo, magnesio y potasio.

**Concentrado modelo**:

* 30 kg de maíz
* 20 kg de soja tostada
* 10 kg de aceite de palma
* 5 kg de vitaminas y minerales
* 35 kg de proteína de soja tostada o alfalfa tostada (como fuente de proteína bypass)

**Forraje modelo**:

* 20% de heno de alfalfa
* 30% de silaje de avena
* 30% de heno de cebada
* 20% de silaje de maíz

**Recomendaciones**:
La ración debe ser ajustada según la edad, raza, condición corporal y producción láctea de los animales. Se recomienda una ración diaria de 2,5 a 3 kg de concentrado y de 10 a 12 kg de forraje. Debe asegurarse de que los animales tengan acceso a agua fresca y limpia.

En resumen, una dieta adecuada para el ganado lechero durante la época seca debe ser capaz de proporcionar suficiente energía, proteína y nutrientes esenciales para mantener la producción láctea y la condición corporal. Es fundamental diseñar una dieta que se adapte a las necesidades individuales de los animales y a las condiciones climáticas y de disponibilidad de forrajes.', CAST(N'2025-05-28T22:54:37.873' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (2, N'Salud', N'que hago si una vaca tiene fiebre y no come', N'Excelente pregunta!

Si una vaca tiene fiebre (temperatura corporal superior a 39°C) y no come, es crucial actuar rápidamente para evitar complicaciones graves y posibles consecuencias fatales.

** Primera medida: **
Revisar si la vaca tiene acceso a agua fresca y libre de contaminación. La deshidratación es un problema grave en casos de fiebre, por lo que es fundamental garantizar que la vaca tenga agua disponible en todo momento.

** Segunda medida: **
Realizar un examen físico detallado de la vaca, buscando signos de dolor o malestar (relación, postura anormal, gemidos, etc.).
signos de enfermedad respiratoria (tos, secreción nasal, respiración rápida o dificultosa.
signos de diarrea o deshidratación (diarrea acuosa, deshidratación severa, etc.).

** Tercera medida: **
Tomar la temperatura rectal y registrarla. Es importante tener en cuenta que la temperatura corporal normal en vacas adultos es de 38,5-39°C.

** Cuarta medida: **
Realizar un análisis de sangre (hemograma) y una exploración física más detallada, si es posible, para detectar posibles causas subyacentes, como:

Infecciones bacterianas (neumonía, septicemia, etc.).
Infecciones virales (virus respiratorio bovino, virus de la diarrea viral, etc.).
Enfermedades metabólicas (hipoglucemia, hipocalcemia, etc.).
Problemas gastrointestinales (desarrollo de abscesos hepáticos, pancreatitis, etc.).

** Quinta medida: **
Tratar la fiebre y el dolor con terapia sintomática, bajo la supervisión de un veterinario. Puede incluir:

Antipiréticos (antiinflamatorios como flumicinol, ketoprofeno, etc.).
Analgesicos (dipirona, carprofeno, etc.).
Antiinflamatorios esteroideos (dexametasona, etc.).

** Sexta medida: **
Implementar medidas para mejorar la ingesta alimenticia de la vaca, ofreciendo:

Alimentos suaves y facilmente digestibles (silajes, granos, etc.).
Suplementos nutricionales específicos (electrolitos, vitaminas, minerales, etc.).

** Séptima medida: **
Realizar un seguimiento cuidadoso de la evolución de la vaca, evaluando la respuesta al tratamiento y ajustándolo según sea necesario.

Recuerda que la fiebre y la anorexia en vacas pueden ser síntomas de various enfermedades graves, por lo que es crucial trabajar en estrecha colaboración con un profesional veterinario para determinar el diagnóstico y tratamiento adecuados.', CAST(N'2025-05-29T19:56:56.380' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (3, N'Reproducción', N'que hacer si el ternero no se quiere amamantar', N'Una situación común en la ganadería! Si el ternero no se quiere amamantar, hay varias razones que pueden estar detrás de este comportamiento. A continuación, te presento algunas posibles causas y soluciones:

**Causas posibles:**

1. **Insuficiente colostro**: El colostro es la primera leche que produce la vaca después del parto, y es rico en anticuerpos y nutrientes esenciales para el ternero. Si la vaca no produce suficiente colostro o si el ternero no puede acceder a ella, puede no querer amamantar.
2. **Problemas de salud en el ternero**: El ternero puede estar enfermo o tener dolores que le impiden amamantar. Es importante revisar al ternero para detectar cualquier problema de salud.
3. **Problemas de acceso**: La vaca puede tener un problema de salud que le impida permitir que el ternero amamante, como un problema de útero o una enfermedad mamaria.
4. **Estrés o ansiedad**: El ternero puede estar estresado o ansioso, lo que puede impedirle amamantar.

**Soluciones:**

1. **Suplementar colostro**: Si la vaca no produce suficiente colostro, se puede administrar colostro adiciona de otra vaca que acaba de parir o se puede utilizar un sustituto de colostro.
2. **Revisar y tratar al ternero**: Revisar al ternero para detectar problemas de salud y tratarlos según sea necesario.
3. **Ayudar al acceso**: Ayudar al ternero a acceder al pezón de la vaca, asegurándose de que el ternero esté tranquilo y sin estrés.
4. **Crear un entorno tranquilo**: Crear un entorno tranquilo y sin estrés para el ternero y la vaca, lo que puede ayudar a fomentar el amamantamiento.
5. **Utilizar una botella de alimentación**: Si el ternero no puede amamantar, se puede utilizar una botella de alimentación para proporcionarle el alimento que necesita.

Es importante recordar que cada situación es única, por lo que es recomendable consultar con un veterinario especializado en ganadería para diagnosticar y tratar la causa subyacente.', CAST(N'2025-05-29T20:12:36.727' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (4, N'Otra', N'5', N'¡Hola! Como veterinario especializado en ganadería, estoy aquí para ayudarte con cualquier inquietud o problema relacionado con la salud y el bienestar de tus animales.

¿Cuál es la pregunta o inquietud específica que tienes? ¿Se trata de una enfermedad, una lesión, un comportamiento anómalo o alguna otra cosa? Por favor, proporciona más detalles para que pueda brindarte una respuesta.', CAST(N'2025-05-30T15:59:42.087' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (5, N'Salud', N'5', N'¡Claro! como veterinario especializado en ganadería, puedo responder a tu pregunta sobre salud en el sector ganadero.

**Pregunta 5: ¿Cuáles son los síntomas más comunes de una infección por enfermedad respiratoria en ganado porcino?**

La respuesta es la siguiente:

Los síntomas más comunes de una infección por enfermedad respiratoria en ganado porcino pueden incluir:

1. **Respiración rápida y trabajosa**: Los animales pueden mostrar un aumento en la frecuencia respiratoria y esfuerzo para respirar.
2. **/tos**: Un sonido respiratorio audible, especialmente en lechones y cerdos jóvenes**.
3. **Fiebre**: La temperatura corporal puede aumentar por encima de lo normal (normalmente entre 38.5 y 40°C).
4. **Depresión**: Los animales pueden mostrar una disminución en la actividad y apetito.
5. **Mucosa nasal y ocular secreta**: Se puede observar una secreción mucosa o purulenta en la nariz y ojos.
7. **Pérdida de peso**: Los animales pueden mostrar una disminución en el crecimiento y pérdida de condición corporal.

Es importante tener en cuenta que estos síntomas pueden variar en severidad y pueden estar relacionados con otras enfermedades respiratorias, por lo que es fundamental realizar un diagnóstico diferencial para determinar la causa subyacente y implementar un tratamiento efectivo.

Recuerda que la prevención es clave en la ganadería. Implementar buenas prácticas de manejo, como una adecuada ventilación, higiene y alimentación, puede ayudar a reducir el riesgo de enfermedades en el ganado porcino.

Si tienes alguna pregunta más, no dudes en preguntar!', CAST(N'2025-05-30T16:57:55.403' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (6, N'Salud', N'que vacunas necesita un ternero recien nacido', N'Excelente pregunta!

Como veterinario especializado en ganadería, te puedo informar que los terneros recién nacidos necesitan vacunas para protegerlos contra enfermedades específicas que pueden afectar su salud y bienestar. A continuación, te presento las vacunas recomendadas para terneros recién nacidos:

1. **Vacuna contra Clostridium perfringens tipo C y D** (Enterotoxemia): Esta vacuna protege contra la enterotoxemia, una enfermedad que puede causar diarrea severa y muerte en terneros. La vacunación se realiza generalmente a los 2-3 días de nacimiento y se repite a los 10-14 días de vida.

2. **Vacuna contra Rotavirus**: Esta vacuna protege contra la diarrea viral causada por el rotavirus, que es una de las enfermedades más comunes en terneros recién nacidos. La vacunación se realiza generalmente a los 2-3 días de nacimiento y se repite a los 10-14 días** de vida.

3. **Vacuna contra E. coli**: Esta vacuna protege contra la E. coli, una bacteria que puede causar diarrea y septicemia en terneros. La vacunación se realiza generalmente a los 2-3 días de nacimiento y se repite a los 10-14 días de vida.

4. **Vacuna contra Virus de la Diarrea Viral Bovina (BVDV)**: Esta vacuna protege contra el virus de la diarrea viralc bovina, que puede causar diarrea, abortos y muerte en terneros. La vacunación se realiza generalmente a los 2-3 días de nacimiento y se repite a los 10-14 días de vida.

Es importante mencionar que el programa de vacunación debe ser personalizado según las necesidades específicas de cada granja y las condiciones epidemiológicas locales. Es recomendable consultar con un veterinario local para determinar el programa de vacunación adecuado para tu granja.

Recuerda que, además de la vacunación, es importante implementar prácticas de higiene y manejo adecuadas para prevenir enfermedades en terneros recién nacidos.', CAST(N'2025-05-30T17:01:19.380' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (7, N'Alimentación', N'que alimento es mejor para engordar ganado en epoca seca ', N'Como veterinario especializado en ganadería, te recomiendo que, durante la época seca, alimentes a tu ganado con dietas que sean ricas en energía y nutrientes, ya que la disponibilidad de alimentos naturales es limitada.

Entre las opciones de alimento que recomiendo para engordar ganado en época seca son:

1. **Concentrados**: Son mezclas de granos, como maíz, trigo, cebada, y alimentos de alta energía, como tortas de aceite de palma o de algodón. Estos alimentos aportan una alta densidad energética, lo que permite a los animales engordar rápidamente.
2. **Alfalfa**: Es un alimento rico en proteínas y fibra, que ayuda a mantener la salud intestinal y el desarrollo de los animales. La alfalfa es un buena opción para engordar ganado en época seca, ya que es más digestible que los alimentos naturales disponibles durante esta época.
4. **Granos**: Como el maíz, grano de trigo, cebada y otros, que aportan una alta densidad energética y son fáciles de digerir.
5. **Subproductos agroindustriales**: Como subproductos de la industria de aceites vegetales, como tortas de aceite de palma o de algodón, que son ricos en energía y nutrientes.

Es importante mencionar que, antes de elegir un alimento, debes considerar factores como la raza, la edad, el sexo y el estado productivo de tus animales, así como la calidad y disponibilidad de los alimentos en tu región.

Recuerda que es fundamental proporcionar acceso a agua fresca y limpia en todo momento, ya que la disponibilidad de agua es crucial para la salud y el desarrollo de los animales.

Espero que esta respuesta te haya ayudado. ¡Si tienes más preguntas, no dudes en preguntar!', CAST(N'2025-05-30T17:04:19.473' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (8, N'Alimentación', N'cuanto concentardo debe comer una vaca lechera al dia', N'Excelente pregunta!

La cantidad de concentrado que debe comer una vaca lechera al día depende de varios factores, como la raza, la edad, el nivel de producción de leche, el estado de lactancia y la calidad del forraje disponible. Sin embargo, hay algunas guías generales que podemos seguir.

En general, se recomienda que una vaca lechera consuma entre 0.3 y 0.5 kg de concentrado por cada kg de leche producida. Por ejemplo, si una vaca produce 30 kg de leche, debería consumir aproximadamente 9 y 15 kg de concentrado al día (30 kg x 0.3 kg/kg y 30 kg x 0.5 kg/kg, respectivamente).

Sin embargo, es importante considerar también la cantidad de fibra digestible (FD) en la dieta total, que debería representar al menos el 18-20% de la materia seca total consumida. La FD es fundamental para mantener una buena salud ruminal y evitar problemas digestivos.

Aquí hay algunas directrices más específicas según la producción de leche:

* Vacas de alta producción (>35 kg/día): 12-15 kg de concentrado al día
* Vacas de producción media (25-35 kg/día): 9-12 kg de concentrado al día
* Vacas de baja producción (<25 kg/día): 6-9 kg de concentrado al día

Recuerda que estas son solo guías generales, y la cantidad de concentrado que una vaca lechera debe comer al día debe ser determinada por un veterinario o un nutricionista especializado en ganadería, que tenga en cuenta las condiciones específicas de la granja y las necesidades individuales de cada animal.

Espero que esta información sea útil. ¿Tienes alguna otra pregunta sobre alimentación de vacas lecheras?', CAST(N'2025-05-30T17:17:39.690' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (9, N'Salud', N'que hacer si una vaca tiene diarrea', N'Excelente pregunta! La diarrea en vacas es un problema común que puede afectar la salud y el rendimiento de la ganadera. Aquí te presento los pasos a seguir si una vaca tiene diarrea:

**Diagnóstico**:

1. **Observación**: Verificar si la vaca muestra signos de diarrea, como heces líquidas o semi-líquidas, frecuencia aumentada de defecación, y posible debilidad o deshidratación.
2. **Examen físico**: Realizar un examen físico para evaluar el estado de la vaca, incluyendo la temperatura corporal, frecuencia respiratoria, y la condición del sistema gastrointestinal.
3. **Muestreo**: Tomar una muestra de heces para realizar un diagnóstico bacteriológico o viral, si es necesario.

**Tratamiento**:

1. **Hidratación**: Administrar fluidos orales o intravenosos para prevenir la deshidratación. El fluido de elección es el suero glucosado al 5%.
2. **Dietética**: Suspender el consumo de alimentos sólidos por 24 a 48 horas y ofrecer una dieta blanda, como jugo de alfalfa o agua con electrolitos.
3. **Anti-diarréicos: Administrar anti-diarréicos específicos, como kaolín, bismuto subsalicilato o sulfato de calcio, según la severidad de la diarrea y la respuesta del animal.
4. **Antibioterapia**: Si se detecta una infección bacteriana, administrar antibióticos específicos bajo prescripción veterinaria.
5. **Control de enfermedades**: Realizar un programa de control de enfermedades para prevenir la transmisión de patógenos, como el cryptosporidiosis o la neumonía viral.

**Medidas preventivas**:

1. **Higiene**: Mantener buenos estándares de higiene en la granja, incluyendo la limpieza de los establos y la eliminación regular de los desechos.
2. **Vacunación**: Vacunar a las vacas contra patógenos comunes que causan diarrea, como el rotavirus y el coronavirus.
3. **Nutrición**: Proporcionar una dieta equilibrada y de alta calidad, adecuada para la edad y la categoría del animal.
4. **Acceso a agua**: Asegurarse de que las vacas tengan acceso a agua fresca y limpia en todo momento.

Recuerda**: Si la diarrea es causada por una enfermedad subyacente, como la neumonía o la mastitis, es importante tratar la enfermedad de base. En cualquier caso, es fundamental consultar con un veterinario especializado en ganadería para obtener un diagnóstico y tratamiento adecuados.', CAST(N'2025-05-30T17:30:53.613' AS DateTime))
INSERT [dbo].[ConsultasGanaderas] ([Id], [Categoria], [Pregunta], [Respuesta], [FechaHora]) VALUES (10, N'Alimentación', N'que come una vaca lechera', N'Excelente pregunta!

Una vaca lechera es un animal que produce leche para consumo humano, y su alimentación es crucial para la producción de leche de alta calidad. Las vacas lecheras necesitan una dieta equilibrada y nutricionalmente rica para producir leche de alta calidad.

La dieta de una vaca lechera puede variar dependiendo de la edad, el estado de lactancia y la disponibilidad de alimentos en general. Sin embargo, en general, una vaca lechera consume una dieta compuesta por:

1. **Fibras**: como hierba, alfalfa, maíz, granos, etc. Estas fibras proporcionan energía y fibra dietética.
2. **Concentrados**: como granos de cereales, como trigo, maíz, cebada, etc. Estos concentrados aportan energía y proteínas.
3. **Forrajes**: como ensilados de maíz, avena, cebada, que aportan fibra y energía.
4. **Minerales**: como calcio, fósforo, potasio, magnesio, etc. que son esenciales para la producción de leche y el mantenimiento de la salud.
5. **Vitaminas**: como vitamina D, vitamina E, etc. que son importantes para la salud y la producción de leche.

Una vaca lechera puede consumir alrededor de 40-50 kg de alimento diario, distribuidos en 2-3 comidas al día.

En términos de nutrientes específicos, una vaca lechera necesita:

* 18-20 kg de fibra dietética
* 2-3 kg de proteína digestible
* 4-5 kg de energía bruta
* 1-2 kg de calcio
* 1-2 kg de fósforo
* 0,5-1 kg de magnesio
* 0,5-1 kg de potasio

Es importante destacar que la calidad y cantidad de la alimentación varía según la edad, la raza, la producción de leche y el estado de lactancia de la vaca. Un nutricionista bovino experto puede ayudar a formular una dieta personalizada para cada vaca lechera.', CAST(N'2025-05-30T17:35:18.183' AS DateTime))
SET IDENTITY_INSERT [dbo].[ConsultasGanaderas] OFF
GO
ALTER TABLE [dbo].[ConsultasGanaderas] ADD  DEFAULT (getdate()) FOR [FechaHora]
GO
USE [master]
GO
ALTER DATABASE [GanadoAI] SET  READ_WRITE 
GO
