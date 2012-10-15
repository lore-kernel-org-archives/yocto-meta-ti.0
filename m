Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7A63E013A6
	for <meta-ti@yoctoproject.org>; Mon, 15 Oct 2012 06:30:47 -0700 (PDT)
Received: from localhost ([127.0.0.1]:58035 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TNkkj-0001Hu-Rx
	for meta-ti@yoctoproject.org; Mon, 15 Oct 2012 13:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type
	:content-transfer-encoding; s=default; bh=ViSKuwak+frUaz8eFISBJL
	nVEQw=; b=SBSpTaetiWHOofo+udaMhWOW0f9GxdbN/cExBjN+W7diBTylS0PCLg
	EtUs1ISHRt0nEVYuo4vAJgwyNWL5aGryza7l02dQNu8MDoLE37NxdslwbmAnzUcF
	+aHoUs8BC2IDORSr6NjtFThE+G3CbbXsIklLGncB6OtYyuqllRDRM=
Received: from [195.171.99.130] (port=39244 helo=[192.168.0.44])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TNkkj-0001Hr-Pl
	for meta-ti@yoctoproject.org; Mon, 15 Oct 2012 13:30:41 +0000
Message-ID: <507C1073.3060703@communistcode.co.uk>
Date: Mon, 15 Oct 2012 14:32:35 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: u-boot compile failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2012 13:30:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

It seems that u-boot is attempting to use GCC includes from my host 
system here. This surely isn't right is it?

DEBUG: Executing shell function do_compile
NOTE: make -j 9 HOSTCC=gcc  HOSTLD=ld 
HOSTLDFLAGS=-L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-O1 HOSTSTRIP=true tools
make -C tools all
make[1]: Entering directory 
`/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
make[1]: *** No rule to make target 
`/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include/stddef.h', needed 
by `crc32.o'.  Stop.
make[1]: Leaving directory 
`/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
make: *** [tools] Error 2
ERROR: oe_runmake failed
ERROR: Function failed: do_compile (see 
/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.15275 
for further information)

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


