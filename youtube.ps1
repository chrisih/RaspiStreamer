$videos=Invoke-RestMethod -uri " https://www.googleapis.com/youtube/v3/playlistItems?playlistId=PLPK9DUftqopOjOrcRbZNpgfjD4YFb1J1P&key=AIzaSyCcEyWrzYcq0ABVX_RLk4BXOAGmkpMDnQU&part=snippet"
foreach($current in $videos.items)
{
  if($current.snippet.position -eq 0)
  {
    $vid=$current.snippet.resourceId.videoId
    Write-Host $current.snippet.title
    Write-Host $vid
    & "cvlc"  https://youtube.com/watch?v=$vid --fullscreen
  }
}
