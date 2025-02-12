DECLARE @XMLTES xml = '<ns:Resume xmlns:ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume">
  <ns:Name>
    <ns:Name.Prefix />
    <ns:Name.First>Shai</ns:Name.First>
    <ns:Name.Middle />
    <ns:Name.Last>Bassli</ns:Name.Last>
    <ns:Name.Suffix />
  </ns:Name>
  <ns:Skills>
I am an experienced and versatile machinist who can operate a range of machinery personally as well as supervise the work of other machinists. I specialize in diagnostics and precision inspection, have expertise in reading blueprints, and am able to call on strong interpersonal and communication skills to guide the work of other production machinists whose work I am called upon to inspect. 
My degree in mechanical engineering affords me a better theoretical understanding and mathematical background than many other candidates in the machinist trade.
    </ns:Skills>
  <ns:Employment>
    <ns:Emp.StartDate>2000-06-01Z</ns:Emp.StartDate>
    <ns:Emp.EndDate>2002-09-30Z</ns:Emp.EndDate>
    <ns:Emp.OrgName>Wingtip Toys</ns:Emp.OrgName>
    <ns:Emp.JobTitle>Lead Machinist</ns:Emp.JobTitle>
    <ns:Emp.Responsibility> Supervised work of staff of four machinists. Coordinated all complex assembly and tooling activities, including production of tricycles and wagons.
Developed parts fabrication from sample parts, drawings and verbal orders.Worked with ISO9000 implementation.
        </ns:Emp.Responsibility>
    <ns:Emp.FunctionCategory>Production</ns:Emp.FunctionCategory>
    <ns:Emp.IndustryCategory>Manufacturing</ns:Emp.IndustryCategory>
    <ns:Emp.Location>
      <ns:Location>
        <ns:Loc.CountryRegion>US </ns:Loc.CountryRegion>
        <ns:Loc.State>MI </ns:Loc.State>
        <ns:Loc.City>Saginaw</ns:Loc.City>
      </ns:Location>
    </ns:Emp.Location>
  </ns:Employment>
  <ns:Employment>
    <ns:Emp.StartDate>1996-11-15Z</ns:Emp.StartDate>
    <ns:Emp.EndDate>2000-05-01Z</ns:Emp.EndDate>
    <ns:Emp.OrgName>Blue Yonder Airlines</ns:Emp.OrgName>
    <ns:Emp.JobTitle>Machinist</ns:Emp.JobTitle>
    <ns:Emp.Responsibility>Repaired and maintained a variety of production and fabrication machine tools.
Set up and operated machines to close tolerances. Used and wrote CNC machine programs. Trained extensively in computer-aided manufacturing.
        </ns:Emp.Responsibility>
    <ns:Emp.FunctionCategory>Production</ns:Emp.FunctionCategory>
    <ns:Emp.IndustryCategory>Manufacturing</ns:Emp.IndustryCategory>
    <ns:Emp.Location>
      <ns:Location>
        <ns:Loc.CountryRegion>US </ns:Loc.CountryRegion>
        <ns:Loc.State>IL </ns:Loc.State>
        <ns:Loc.City>Chicago</ns:Loc.City>
      </ns:Location>
    </ns:Emp.Location>
  </ns:Employment>
  <ns:Employment>
    <ns:Emp.StartDate>1994-06-10Z</ns:Emp.StartDate>
    <ns:Emp.EndDate>1996-07-22Z</ns:Emp.EndDate>
    <ns:Emp.OrgName>City Power and Light</ns:Emp.OrgName>
    <ns:Emp.JobTitle>Assistant Machinist</ns:Emp.JobTitle>
    <ns:Emp.Responsibility>Performed centerless grinding. Received training in manual mill and lathe machines, as well as micrometers and calipers.
Owned complete toolset.Worked extensive overtime on request. </ns:Emp.Responsibility>
    <ns:Emp.FunctionCategory>Production</ns:Emp.FunctionCategory>
    <ns:Emp.IndustryCategory>Manufacturing</ns:Emp.IndustryCategory>
    <ns:Emp.Location>
      <ns:Location>
        <ns:Loc.CountryRegion>US </ns:Loc.CountryRegion>
        <ns:Loc.State>IA </ns:Loc.State>
        <ns:Loc.City>Des Moines</ns:Loc.City>
      </ns:Location>
    </ns:Emp.Location>
  </ns:Employment>
  <ns:Education>
    <ns:Edu.Level>Bachelor</ns:Edu.Level>
    <ns:Edu.StartDate>1990-09-15Z</ns:Edu.StartDate>
    <ns:Edu.EndDate>1994-05-10Z</ns:Edu.EndDate>
    <ns:Edu.Degree>Bachelor of Science</ns:Edu.Degree>
    <ns:Edu.Major>Mechanical Engineering</ns:Edu.Major>
    <ns:Edu.Minor />
    <ns:Edu.GPA>3.2</ns:Edu.GPA>
    <ns:Edu.GPAScale>4</ns:Edu.GPAScale>
    <ns:Edu.School>Midwest State University</ns:Edu.School>
    <ns:Edu.Location>
      <ns:Location>
        <ns:Loc.CountryRegion>US </ns:Loc.CountryRegion>
        <ns:Loc.State>IA </ns:Loc.State>
        <ns:Loc.City>Ames</ns:Loc.City>
      </ns:Location>
    </ns:Edu.Location>
  </ns:Education>
  <ns:Address>
    <ns:Addr.Type>Home</ns:Addr.Type>
    <ns:Addr.Street>567 3rd Ave</ns:Addr.Street>
    <ns:Addr.Location>
      <ns:Location>
        <ns:Loc.CountryRegion>US </ns:Loc.CountryRegion>
        <ns:Loc.State>MI </ns:Loc.State>
        <ns:Loc.City>Saginaw</ns:Loc.City>
      </ns:Location>
    </ns:Addr.Location>
    <ns:Addr.PostalCode>53900</ns:Addr.PostalCode>
    <ns:Addr.Telephone>
      <ns:Telephone>
        <ns:Tel.Type>Voice</ns:Tel.Type>
        <ns:Tel.IntlCode>1</ns:Tel.IntlCode>
        <ns:Tel.AreaCode>276</ns:Tel.AreaCode>
        <ns:Tel.Number>555-0114</ns:Tel.Number>
      </ns:Telephone>
      <ns:Telephone>
        <ns:Tel.Type>Fax</ns:Tel.Type>
        <ns:Tel.IntlCode>1</ns:Tel.IntlCode>
        <ns:Tel.AreaCode>276</ns:Tel.AreaCode>
        <ns:Tel.Number>555-0132</ns:Tel.Number>
      </ns:Telephone>
    </ns:Addr.Telephone>
  </ns:Address>
  <ns:EMail>Shai@Example.com</ns:EMail>
  <ns:WebSite />
</ns:Resume>'

--Declare @Idxml VARCHAR(100)= 'declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";'

SELECT @XMLTES.value( 'declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume";
	   (/ns:Resume/ns:Name/ns:Name.First)[1]', 'varchar(50)') [Name.First]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Name/ns:Name.Last)[1]', 'varchar(50)') [Name.Last]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.StartDate)[1]', 'varchar(50)') [StartDate]
	    ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.EndDate)[1]', 'varchar(50)') [EndDate]
		,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.OrgName)[1]', 'varchar(100)') [OrgName]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.JobTitle)[1]', 'varchar(100)') [JobTitle]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.Responsibility)[1]', 'varchar(max)') [Responsibility]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.FunctionCategory)[1]', 'varchar(50)') [FunctionCategoryFunctionCategory]
	   ,@XMLTES.value('declare namespace ns="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/Resume"; 
	   (/ns:Resume/ns:Employment/ns:Emp.IndustryCategory)[1]', 'varchar(50)') [FunctionCategoryFunctionCategory]

		
---ns:Emp.Location/
	   ----ns:Emp.IndustryCategory
	   ------ ns:Emp.FunctionCategory

	

/*
SELECT
    n.value('(ns:Name.First)[1]', 'nvarchar(50)') AS Nombre,
    n.value('(ns:Name.Last)[1]', 'nvarchar(50)') AS Apellido,
    e.value('(ns:Emp.OrgName)[1]', 'nvarchar(50)') AS Empresa,
    e.value('(ns:Emp.JobTitle)[1]', 'nvarchar(50)') AS Puesto,
    e.value('(ns:Emp.StartDate)[1]', 'date') AS FechaInicio,
    e.value('(ns:Emp.EndDate)[1]', 'date') AS FechaFin,
    e.value('(ns:Emp.Responsibility)[1]', 'nvarchar(max)') AS Responsabilidades,
    ed.value('(ns:Edu.Degree)[1]', 'nvarchar(50)') AS Grado,
    ed.value('(ns:Edu.Major)[1]', 'nvarchar(50)') AS Carrera,
    ed.value('(ns:Edu.Level)[1]', 'nvarchar(50)') AS NivelEducacion,
    ed.value('(ns:Edu.StartDate)[1]', 'date') AS FechaInicioEducacion,
    ed.value('(ns:Edu.EndDate)[1]', 'date') AS FechaFinEducacion
FROM @XMLTES.nodes('/ns:Resume') AS x(r)
OUTER APPLY r.nodes('ns:Name') AS y(n)
OUTER APPLY r.nodes('ns:Employment') AS z(e)
OUTER APPLY r.nodes('ns:Education') AS edu(ed)


*/