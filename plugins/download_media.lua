local function callback(extra, success, result) -- Calback for load_photo in line 17
  if success then
    print('File downloaded to:', result)
  else
    print('Error downloading: '..extra)
  end
end

local function run(msg, matches)
  if not is_momod(msg) then -- Will download images only from mods,owner and admins
    return
  end
  if msg.media then
    if msg.media.type == 'photo' then
      load_photo(msg.id, callback, msg.id)
    end
  end
end

local function pre_process(msg)
  if not msg.text and msg.media then
    msg.text = '['..msg.media.type..']'
  end
  return msg
end

return {
  run = run,
  patterns = {
    '%[(photo)%]'
	},
  pre_process = pre_process
}
--Copyright; @Oo_mehdi_shar_khoffash_revale_oO
--Persian Translate; @Oo_mehdi_shar_khoffash_revale_oO
--ch : @kingbot_team
--کپی بدون ذکر منبع حرام است
