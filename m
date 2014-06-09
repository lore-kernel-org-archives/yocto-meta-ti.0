Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FF48E00B4C; Sun,  8 Jun 2014 17:24:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [213.150.131.21 listed in list.dnswl.org]
Received: from smtprelay-b32.telenor.se (smtprelay-b32.telenor.se
	[213.150.131.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EA9AE0073A
	for <meta-ti@yoctoproject.org>; Sun,  8 Jun 2014 17:24:02 -0700 (PDT)
Received: from ipb1.telenor.se (ipb1.telenor.se [195.54.127.164])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id C6FF9F0FB
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 02:24:01 +0200 (CEST)
X-SENDER-IP: [83.227.57.112]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmIkAID9lFNT4zlwPGdsb2JhbAANTItbo2YBBpkQAYEgBAEBAQE4hDgBAQEBAzhAEQsYCRQCDwkDAgECATEUEwYCAQGIQ6lRn3IXhV2JFhaEKwEDmiGXAw
X-IPAS-Result: AmIkAID9lFNT4zlwPGdsb2JhbAANTItbo2YBBpkQAYEgBAEBAQE4hDgBAQEBAzhAEQsYCRQCDwkDAgECATEUEwYCAQGIQ6lRn3IXhV2JFhaEKwEDmiGXAw
X-IronPort-AV: E=Sophos;i="4.98,1000,1392159600"; d="scan'208";a="25381170"
Received: from c-7039e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.112])
	by ipb1.telenor.se with ESMTP; 09 Jun 2014 02:24:01 +0200
Message-ID: <5394FEA0.1020602@emagii.com>
Date: Mon, 09 Jun 2014 02:24:00 +0200
From: Ulf Samuelsson <meta-ti@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5392397D.4000504@emagii.com>	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com>
In-Reply-To: <5392BE20.2000509@emagii.com>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 00:24:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


2014-06-07 09:24, Ulf Samuelsson skrev:
>
> 2014-06-07 00:38, Denys Dmytriyenko skrev:
>> On June 6, 2014 5:58:21 PM EDT, Ulf Samuelsson <meta-ti@emagii.com> 
>> wrote:
>>> Anyone succeded with this?
>>>
>>> Which version of Yocto (dora/daisy?)
>>>
>>> Which kernel
>>>
>>> Any extra patches needed?
>>>
>>> Any image recipe which can be shared?
>>>
>>> BR
>>> Ulf Samuelsson
>> I have the necessary recipes and images in meta-arago. And you'd 
>> obviously need meta-qt5. Do you need any specific features out of it?
>>
> Could you send me your
>
> * local.conf
> * bblayers.conf
>
>  for building qt5?
>
> BR
> Ulf
>
>
Have managed to build meta-arago/meta-ti/meta-qt5,

Build Configuration:
BB_VERSION        = "1.20.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-12.04"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "arago"
DISTRO_VERSION    = "2014.05"
TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
TARGET_FPU        = "vfp-neon"
meta-bugfix       = "master:d61c6e5c9074383ae90ec8ae4b9724f3ea82f5e6"
meta-arago-distro
meta-arago-extras = "master:6a6e742536ed367dc0565d665bc1ea49a2074adc"
meta-qt5          = "dora:5b5616b63bdf163ea3eb2ca8857c56a393435fe3"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "dora:ee173678383683e972c7d4d6f0ef5790bfa50274"
meta-ti           = "dora:72def59ce0da8f20638086e9fe6c9f9f4c9dd6f4"
meta-linaro-toolchain = "dora:503b1fe68f90a8e2b43c456ddd17a0a90816cf9c"
meta              = "dora:68da848e0f7f026bf18707d8d59143177ff66f9b"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 3564 tasks of which 3561 didn't need to 
be rerun and all succeeded.
-------------------------------------------------------------------------------------------------------------------------------------------

I am now running a Beaglebone Black with a 4Dsystems 4.3" LCD.

The LCD  is all black.

Created my own image, based on arago-qt5-test-image

This does not add libgles-omap3, which seems to be needed.

Also built the qtbase-examples.

The resulting filesystem did not find the modules, but after depmod -a, 
this is OK.

root@beaglebone:/usr/share/qt5/examples/widgets/widgets/calculator# lsmod
Module                  Size  Used by
bufferclass_ti          5405  0
omaplfb                11414  0
pvrsrvkm              175499  2 bufferclass_ti,omaplfb

I can run several Qt applications, but: Screen is all black.

I do not get a splash screen,  and I did not change any device-tree files,
so I assume this is the problem.

Anyone has a working device tree file for this?

Romber Nelson and some other people mention that the 3.12 kernel used is 
not compatible with the advanced capes like LCDs.
Do I need to revert to the 3.8 kernel?





