#!/usr/bin/ruby

def find_princess (n, grid)
	i = 0;
	
	if grid[i][0] == 'p'
		r = i
		c = 0
	end

	if grid[i][n-1] == 'p'
		r = i
		c = n
	end

	if grid[n-1][0] == 'p'
		r = n-1
		c = 0
	end

	if grid[n-1][n-1] == 'p'
		r = n-1
		c = n-1
	end
	
	[r,c]
end

def get_my_position(n)
	[n/2, n/2]
end

def displayPathtoPrincess(n,grid)	
  p = find_princess(n, grid)
  m = get_my_position(n)
  
  while(m[0]< p[0] && m[0] < n)
  	puts 'DOWN'
  	m[0] += 1
  end

  while(m[0] > p[0] && m[0] < n)
  	puts 'UP'
  	m[0] -= 1
  end

  while(m[1]< p[1] && m[0] < n)
  	puts 'RIGHT'
  	m[1] += 1
  end
  while(m[1] > p[1] && m[0] < n)
  	puts 'LEFT'
  	m[1] -= 1
  end
end
# Tail starts here

=begin
---
-m-
p--
=end
n = gets.to_i
r,c = gets.strip.split.map {|num| num.to_i}
grid = Array.new(m)
#grid = '----m-p--' 

grid[0] = '---'
grid[1] = '-m-'
grid[2] = 'p--'

nextMove(n,r,c,grid)
