{
   name = "neofetch",
   source = "https://raw.githubusercontent.com/dylanaraps/neofetch/master/neofetch",
   version = "7.0.0",
   build = [[
      local tmpdir = fs.make_temp_dir("build")
      local ok, err = fs.copy_file(tmpdir .. "/neofetch", "/usr/local/bin/neofetch")
      if not ok then return nil, err end
      local ok, err = fs.remove_dir(tmpdir)
      if not ok then return nil, err end
   ]],
   install = [[
      local ok, err = fs.copy_file("/usr/local/bin/neofetch", "/usr/local/bin/neofetch")
      if not ok then return nil, err end
   ]]
}

{
   name = "busybox",
   source = "https://busybox.net/downloads/busybox-1.33.0.tar.bz2",
   version = "1.33.0",
   build = [[
      local tmpdir = fs.make_temp_dir("build")
      local ok, err = fs.unpack_archive(tmpdir .. "/busybox-1.33.0.tar.bz2")
      if not ok then return nil, err end
      local ok, err = fs.exec("make -C " .. tmpdir .. "/busybox-1.33.0 -j$(nproc) all")
      if not ok then return nil, err end
      local ok, err = fs.remove_dir(tmpdir)
      if not ok then return nil, err end
   ]],
   install = [[
      local ok, err = fs.copy_file("/busybox", "/usr/bin/busybox")
      if not ok then return nil, err end
   ]]
}

{
   name = "htop",
   source = "https://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz",
   version = "2.2.0",
   build = [[
      local tmpdir = fs.make_temp_dir("build")
      local ok, err = fs.unpack_archive(tmpdir .. "/htop-2.2.0.tar.gz")
      if not ok then return nil, err end
      local ok, err = fs.exec("make -C " .. tmpdir .. "/htop-2.2.0 -j$(nproc)")
      if not ok then return nil, err end
      local ok, err = fs.remove_dir(tmpdir)
      if not ok then return nil, err end
   ]],
   install = [[
      local ok, err = fs.copy_file("/htop-2.2.0/htop", "/usr/bin/htop")
      if not ok then return nil, err end
   ]]
}
