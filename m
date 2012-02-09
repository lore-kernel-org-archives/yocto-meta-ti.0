Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36CD3E00307
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 08:11:47 -0800 (PST)
Received: from [192.168.0.29] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 9C6D0280A4
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 15:37:17 +0000 (GMT)
Message-ID: <4F33F01E.2000601@communistcode.co.uk>
Date: Thu, 09 Feb 2012 16:11:10 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120205 Thunderbird/10.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: Beaglebone kernel/u-boot/userspace
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
X-List-Received-Date: Thu, 09 Feb 2012 16:11:47 -0000
Content-Type: multipart/alternative;
	boundary="------------060100090309030203000103"

--------------060100090309030203000103
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In light of the recent discussions today, I have been spurred into 
having another go at getting my beaglebone working with poky/yocto. 
Instead of adding a whole layer I cherry picked out the important bits 
(mainly the kernel package and u-boot) and got a build that would complete.

Upon, trying to boot my beaglebone I recieve the following error:

    INIT: version 2.88 booting
    Starting udevtar: short read

    Starting Bootlog daemon: bootlogd: cannot deduce real console device
    bootlogd.
    [    4.050198] EXT4-fs (mmcblk0p2): re-mounted. Opts:
    user_xattr,barrier=1,data=ordered
    ln: /var/run/ld.so.cache: No such file or directory
    Configuring network interfaces... ifup: can't open
    '/var/run/ifstate': No such file or directory
    done.
    Thu Feb  9 15:34:00 UTC 2012
    [Halts here - will go no further and non-interactive]


Is this an issue with my userspace setup, my u-boot setup or indeed the 
kernel itself?

A point in the right direction would be much appreciated.

Cheers all, I have been enjoying the discussions today.
Jack.

--------------060100090309030203000103
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>In light of the recent discussions today, I have been spurred
      into having another go at getting my beaglebone working with
      poky/yocto. Instead of adding a whole layer I cherry picked out
      the important bits (mainly the kernel package and u-boot) and got
      a build that would complete.<br>
      <br>
      Upon, trying to boot my beaglebone I recieve the following error:<br>
      <br>
    </tt>
    <blockquote><tt>INIT: version 2.88 booting</tt><br>
      <tt>Starting udevtar: short read</tt><br>
      <br>
      <tt>Starting Bootlog daemon: bootlogd: cannot deduce real console
        device</tt><br>
      <tt>bootlogd.</tt><br>
      <tt>[&nbsp;&nbsp;&nbsp; 4.050198] EXT4-fs (mmcblk0p2): re-mounted. Opts:
        user_xattr,barrier=1,data=ordered</tt><br>
      <tt>ln: /var/run/ld.so.cache: No such file or directory</tt><br>
      <tt>Configuring network interfaces... ifup: can't open
        '/var/run/ifstate': No such file or directory</tt><br>
      <tt>done.</tt><br>
      <tt>Thu Feb&nbsp; 9 15:34:00 UTC 2012</tt><br>
      <tt>[Halts here - will go no further and non-interactive]</tt><br>
    </blockquote>
    <tt><br>
      Is this an issue with my userspace setup, my u-boot setup or
      indeed the kernel itself?<br>
      <br>
      A point in the right direction would be much appreciated.<br>
      <br>
      Cheers all, I have been enjoying the discussions today.<br>
      Jack.<br>
    </tt>
  </body>
</html>

--------------060100090309030203000103--
