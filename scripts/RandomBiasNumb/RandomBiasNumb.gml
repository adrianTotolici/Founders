function RandomBiasNumb(_bias, _min_nr, _max_nr){
	var _biased = power(random(1), _bias);
	rand_nr = floor(lerp(_min_nr, _max_nr+0.99,  _biased));
	rand_nr = clamp(rand_nr, _min_nr, _max_nr);
	return rand_nr;
}