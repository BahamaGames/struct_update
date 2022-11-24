/// @function struct_update(source, target, replace)
/// @description Copy/Replace keys from source struct to target struct. Note data structures will not be deep copied.
/// @param {Struct} source Source struct to copy from.
/// @param {Struct} target Target struct to copy to.
/// @param {Bool} replace Overwrite existing target keys with source keys.
function struct_update(s, t, r = false)
{
	for(var i = 0, a = variable_struct_get_names(s), l = array_length(a); i < l; ++i)
	{
		var
		k = a[@ i],
		v = s[$ k],
		c = t[$ k];
		if(c != undefined)
		{
			if(is_array(v))
			{
				var u = array_length(c);
				for(var o = 0, p = array_length(v); o < p; ++o)
				{
					if(!r && o < u) continue;
					c[@ o] = v[@ o];
				}
				continue;
			}else if(is_struct(v))
			{
				struct_update(v, c, r);
				v = c;
			}else if(!r) continue;
		}
		t[$ k] = v;
	}
}
