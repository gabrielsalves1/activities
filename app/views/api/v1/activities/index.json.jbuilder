json.array! @activities do |activity|
  json.id activity.id
  json.name activity.name
  json.description activity.description
  json.date activity.date
  json.activityFile activity.activityFile
  json.activityFile_blob activity.activityFile_blob
end
