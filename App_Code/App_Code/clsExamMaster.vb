Imports System.Web
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Security
Imports System.Web.UI.WebControls.WebParts

Public Class clsExamMaster

    Private m_Examid As String
    Public Property Examid() As String
        Get
            Return m_Examid
        End Get
        Set(ByVal value As String)
            m_Examid = value
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

    Private m_NegativeMarks As String
    Public Property NegativeMarks() As String
        Get
            Return m_NegativeMarks
        End Get
        Set(ByVal value As String)
            m_NegativeMarks = value
        End Set
    End Property

    Private m_PositiveMarks As String
    Public Property PositiveMarks() As String
        Get
            Return m_PositiveMarks
        End Get
        Set(ByVal value As String)
            m_PositiveMarks = value
        End Set
    End Property

    Private m_TotalMarks As String
    Public Property TotalMarks() As String
        Get
            Return m_TotalMarks
        End Get
        Set(ByVal value As String)
            m_TotalMarks = value
        End Set
    End Property

    Public Function Update() As String
        Dim strRetVal As String = Nothing
        Dim strMessage As String = Nothing
        Dim con As New SqlConnection("Data Source=[DB_HOST]; Initial Catalog=[DB_NAME]; User ID=[DB_USER]; Password=[DB_PASSWORD]")
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.Clear()
        cmd.CommandText = "IntUpdExamMaster"


        cmd.Parameters.AddWithValue("@Examid", m_Examid)
        cmd.Parameters.AddWithValue("@ExamDate", m_ExamDate)
        cmd.Parameters.AddWithValue("@NegativeMarks", m_NegativeMarks)
        cmd.Parameters.AddWithValue("@PositiveMarks", m_PositiveMarks)
        cmd.Parameters.AddWithValue("@TotalMarks", m_TotalMarks)
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