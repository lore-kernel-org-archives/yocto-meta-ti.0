Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 713B5E011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 03:29:31 -0700 (PDT)
Received: from [192.168.0.26] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 8D39C2809C
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 09:59:50 +0000 (GMT)
Message-ID: <4F61C496.2070506@communistcode.co.uk>
Date: Thu, 15 Mar 2012 10:29:42 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120217 Thunderbird/10.0.2
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: u-boot failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 10:29:31 -0000
Content-Type: multipart/alternative;
	boundary="------------060807060408080309050206"

--------------060807060408080309050206
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Trying to compile the systemd-image from Angstrom for the BeagleBone 
this morning and I ran into a few errors, the first one being in meta-ti 
and u-boot related:

    ERROR: Function failed: do_compile (see
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/temp/log.do_compile.18432
    for further information)
    NOTE: make CROSS_COMPILE=arm-angstrom-linux-gnueabi- all
    for dir in tools examples/standalone examples/api arch/arm/cpu/armv7
    /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7/
    ; do \
         make -C $dir _depend ; done
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
    make[1]: Nothing to be done for `_depend'.
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
    make[1]: Nothing to be done for `_depend'.
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
    make[1]: Nothing to be done for `_depend'.
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
    make[1]: Nothing to be done for `_depend'.
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
    make[1]: Nothing to be done for `_depend'.
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
    make -C tools all
    make[1]: Entering directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
    *make[1]: *** No rule to make target
    `/usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.2/include/stddef.h',
    needed by `crc32.o'.  Stop.*
    make[1]: Leaving directory
    `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
    make: *** [tools] Error 2
    ERROR: oe_runmake failed

Could anyone shed any light on this?

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


--------------060807060408080309050206
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>Trying to compile the systemd-image from Angstrom for the
      BeagleBone this morning and I ran into a few errors, the first one
      being in meta-ti and u-boot related:<br>
      <br>
    </tt>
    <blockquote><tt>ERROR: Function failed: do_compile (see
        /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/temp/log.do_compile.18432
        for further information)</tt><br>
      <tt>NOTE: make CROSS_COMPILE=arm-angstrom-linux-gnueabi- all</tt><br>
      <tt>for dir in tools examples/standalone examples/api
        arch/arm/cpu/armv7
        /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7/
        ; do \</tt><br>
      <tt>&nbsp;&nbsp;&nbsp; make -C $dir _depend ; done</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'</tt><br>
      <tt>make[1]: Nothing to be done for `_depend'.</tt><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'</tt><br>
      <tt>make[1]: Nothing to be done for `_depend'.</tt><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'</tt><br>
      <tt>make[1]: Nothing to be done for `_depend'.</tt><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'</tt><br>
      <tt>make[1]: Nothing to be done for `_depend'.</tt><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'</tt><br>
      <tt>make[1]: Nothing to be done for `_depend'.</tt><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'</tt><br>
      <tt>make -C tools all</tt><br>
      <tt>make[1]: Entering directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'</tt><br>
      <b><tt>make[1]: *** No rule to make target
          `/usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.2/include/stddef.h',
          needed by `crc32.o'.&nbsp; Stop.</tt></b><br>
      <tt>make[1]: Leaving directory
`/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'</tt><br>
      <tt>make: *** [tools] Error 2</tt><br>
      <tt>ERROR: oe_runmake failed</tt><br>
    </blockquote>
    <tt>Could anyone shed any light on this?<br>
      <br>
      Regards,<br>
      Jack.<br>
      <br>
    </tt>
    <pre class="moz-signature" cols="72"><tt>-- 

  Jack Mitchell (<a class="moz-txt-link-abbreviated" href="mailto:jack@embed.me.uk">jack@embed.me.uk</a>)             
  Embedded Systems Engineer
  <a class="moz-txt-link-freetext" href="http://www.embed.me.uk">http://www.embed.me.uk</a>

--
</tt></pre>
  </body>
</html>

--------------060807060408080309050206--
