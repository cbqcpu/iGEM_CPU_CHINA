function RA_MODEL()
	x0=zeros(4,1);
	x0(3) = 0.00577667577789773;
	x0(4) = 0.0203298264712407;
	x0(1) = 0.00577667577789773;
	x0(2) = 0.0203298264712407;
	tspan=(0:0.01:100);
	opts = odeset('AbsTol',1e-3);
	[t,x]=ode23tb(@f,tspan,x0,opts);
	plot(t,x);
end

function xdot=f(~,x)
    compartment compartment_1=1.0;
	global_par_parameter_1=0.025;
	global_par_parameter_2=1.0;
	global_par_parameter_3=0.5;
	global_par_parameter_4=3.5;
	global_par_parameter_5=1.25;
    x(1) = x(3);
    x(2) = x(4);
    xdot=zeros(4,1);
	xdot(3) = -x(1)+global_par_parameter_4*x(2)^2/(global_par_parameter_3^2+x(2)^2);
	xdot(4) = (-global_par_parameter_5)*x(2)+1/(1+x(1)^2)*(global_par_parameter_1+global_par_parameter_2*x(2)^2/(1+x(2)^2));
	
end
 
function z=Pow(x,y),z=x^y;end
function z=Root(x,y),z=y^(1/x);end
function z = Piecewise(varargin)
	numArgs = nargin;
	result = 0;
	foundResult = 0;
	for k=1:2: numArgs-1
		if varargin{k+1} == 1
			result = varargin{k};
			foundResult = 1;
			break;
		end
	end
	if foundResult == 0
		result = varargin{numArgs};
	end
	z = result;
end


