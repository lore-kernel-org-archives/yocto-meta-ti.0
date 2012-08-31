Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5B11E0140A
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 06:34:20 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-116-70.range81-153.btcentralplus.com
	[81.153.116.70]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id D92459ADE
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 14:34:19 +0100 (BST)
Message-ID: <5040BD5A.8090801@r-finger.com>
Date: Fri, 31 Aug 2012 14:34:18 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: CMEM module fails to load
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 13:34:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi,

I am trying to get the gstreamer-ti package to work, using the 
v2012.05-yocto1.2 tag of meta-ti and the current Denzil release; 
I am getting an error when the CMEMK module is getting loaded:

Loading kernel modules for gstreamer-ti... 
Running /usr/share/ti/gst/omap3530/loadmodules.sh
[  183.459136] CMEMK module: built on Aug 31 2012 at 12:17:02
[  183.464965]   Reference Linux version 3.0.28
[  183.469451]   File ... /linuxutils_2_26_01_02/packages/ti/sdo/linuxutils/cmem/src/module/cmemk.c
[  183.487823] CMEM Range Overlaps Kernel Physical - allowing overlap
[  183.494293] CMEM phys_start (0x86300000) overlaps kernel (0x80000000 -> 0x9b800000)
[  183.502380] CMEMK Error: Failed to request_mem_region(0x86300000, 16777216)
FATAL: Error inserting cmemk (/lib/modules/3.0.28/kernel/drivers/dsp/cmemk.ko): Bad address

I have also tried the linux-mainline kernel, to be precise commit
b478431b3cb62dae735c26fa2dfd025ffbf0776c, but am getting the same
error. 

Is this a known issue?

Tomas

