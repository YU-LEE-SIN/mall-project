require.config({
	baseUrl:'https://cdnjs.cloudflare.com/ajax/libs/',
	paths:{
		'jquery':'jquery/1.12.4/jquery',
		'jqlazy':'jquery.lazyload/1.9.1/jquery.lazyload.min'
	},
	shim:{
		exports:'',
		dep:['jquery']
	}
})