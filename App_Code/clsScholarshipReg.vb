Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Security
Imports System.Web.UI.WebControls.WebParts

Public Class clsScholarshipReg
    'Private cn As New ConnClass()

    Private m_Mobile As String
    Public Property Mobile() As String
        Get
            Return m_Mobile
        End Get
        Set(ByVal value As String)
            m_Mobile = value
        End Set
    End Property

    Private m_StudentName As String
    Public Property StudentName() As String
        Get
            Return m_StudentName
        End Get
        Set(ByVal value As String)
            m_StudentName = value
        End Set
    End Property

    Private m_Gender As String
    Public Property Gender() As String
        Get
            Return m_Gender
        End Get
        Set(ByVal value As String)
            m_Gender = value
        End Set
    End Property

    Private m_ExamDate As String
    Public Property ExamDate() As String
        Get
            Return m_ExamDate
        End Get
        Set(ByVal value As String)
            m_ExamDate = value
        End Set
    End Property

    Private m_Degree As String
    Public Property Degree() As String
        Get
            Return m_Degree
        End Get
        Set(ByVal value As String)
            m_Degree = value
        End Set
    End Property

    Private m_College As String
    Public Property College() As String
        Get
            Return m_College
        End Get
        Set(ByVal value As String)
            m_College = value
        End Set
    End Property

    Private m_YearSem As String
    Public Property YearSem() As String
        Get
            Return m_YearSem
        End Get
        Set(ByVal value As String)
            m_YearSem = value
        End Set
    End Property

    Private m_branch As String
    Public Property branch() As String
        Get
            Return m_branch
        End Get
        Set(ByVal value As String)
            m_branch = value
        End Set
    End Property

    Private m_CourseTarget As String
    Public Property CourseTarget() As String
        Get
            Return m_CourseTarget
        End Get
        Set(ByVal value As String)
            m_CourseTarget = value
        End Set
    End Property

    Private m_Landline As String
    Public Property Landline() As String
        Get
            Return m_Landline
        End Get
        Set(ByVal value As String)
            m_Landline = value
        End Set
    End Property

    Private m_Email As String
    Public Property Email() As String
        Get
            Return m_Email
        End Get
        Set(ByVal value As String)
            m_Email = value
        End Set
    End Property

    Private m_totalattempts As String
    Public Property totalattempts() As String
        Get
            Return m_totalattempts
        End Get
        Set(ByVal value As String)
            m_totalattempts = value
        End Set
    End Property

    Private m_correct As String
    Public Property correct() As String
        Get
            Return m_correct
        End Get
        Set(ByVal value As String)
            m_correct = value
        End Set
    End Property

    Private m_wrong As String
    Public Property wrong() As String
        Get
            Return m_wrong
        End Get
        Set(ByVal value As String)
            m_wrong = value
        End Set
    End Property

    Private m_Percentage As String
    Public Property Percentage() As String
        Get
            Return m_Percentage
        End Get
        Set(ByVal value As String)
            m_Percentage = value
        End Set
    End Property

    Private m_Waiver As String
    Public Property Waiver() As String
        Get
            Return m_Waiver
        End Get
        Set(ByVal value As String)
            m_Waiver = value
        End Set
    End Property
    Private m_EnquiryCreated As String
    Public Property EnquiryCreated() As String
        Get
            Return m_EnquiryCreated
        End Get
        Set(ByVal value As String)
            m_EnquiryCreated = value
        End Set
    End Property
    Public Function Update() As String
        Dim strRetVal As String = Nothing
        Dim strMessage As String = Nothing
        Dim con As New SqlConnection(" Data Source=[DB_HOST]; Initial Catalog=[DB_NAME]; User ID=[DB_USER]; Password=[DB_PASSWORD]")
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Clear()
        cmd.CommandText = "IntUpdScholarshipReg"


        cmd.Parameters.AddWithValue("@Mobile", m_Mobile)
        cmd.Parameters.AddWithValue("@StudentName", m_StudentName)
        cmd.Parameters.AddWithValue("@Gender", m_Gender)
        cmd.Parameters.AddWithValue("@ExamDate", m_ExamDate)
        cmd.Parameters.AddWithValue("@Degree", m_Degree)
        cmd.Parameters.AddWithValue("@College", m_College)
        cmd.Parameters.AddWithValue("@YearSem", m_YearSem)
        cmd.Parameters.AddWithValue("@branch", m_branch)
        cmd.Parameters.AddWithValue("@CourseTarget", m_CourseTarget)
        cmd.Parameters.AddWithValue("@Landline", m_Landline)
        cmd.Parameters.AddWithValue("@Email", m_Email)
        cmd.Parameters.AddWithValue("@totalattempts", m_totalattempts)
        cmd.Parameters.AddWithValue("@correct", m_correct)
        cmd.Parameters.AddWithValue("@wrong", m_wrong)
        cmd.Parameters.AddWithValue("@Percentage", m_Percentage)
        cmd.Parameters.AddWithValue("@Waiver", m_Waiver)
        cmd.Parameters.AddWithValue("@EnquiryCreated", m_EnquiryCreated)
        cmd.Parameters.Add("@RetVal", SqlDbType.NVarChar, 100)
        cmd.Parameters("@RetVal").Direction = ParameterDirection.ReturnValue
        Try
            con.Open()
            cmd.ExecuteNonQuery()
            strRetVal = cmd.Parameters("@RetVal").Value.ToString()

            If strRetVal.Equals("0") Then
                strMessage = "Record Exists"
            End If

            If strRetVal.Equals("1") Then
                strMessage = "Record Saved"
            End If

            If strRetVal.Equals("2") Then
                strMessage = "Record Updated"
            End If
            Return strMessage
        Catch Err As Exception
            strMessage = Err.Message.ToString()
            Return strMessage
        Finally
            con.Close()
            cmd.Dispose()
        End Try

    End Function
End Class