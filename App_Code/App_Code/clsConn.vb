Imports Microsoft.VisualBasic

Public Class clsConn
    Public ReadOnly Property strConn() As String
        Get
            Return ConfigurationManager.ConnectionStrings("pt_enquiry").ConnectionString.ToString()
        End Get
    End Property
End Class
'dim cn as conn = new conn ()
'cn.strConn()