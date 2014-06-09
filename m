Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B81C5E0073A; Sun,  8 Jun 2014 17:18:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42996E0073A
	for <meta-ti@yoctoproject.org>; Sun,  8 Jun 2014 17:18:38 -0700 (PDT)
Received: from ipb4.telenor.se (ipb4.telenor.se [195.54.127.167])
	by smtprelay-b32.telenor.se (Postfix) with ESMTP id B7A1EDF42
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 02:18:36 +0200 (CEST)
X-SENDER-IP: [83.227.57.112]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmMkAMz8lFNT4zlwPGdsb2JhbAANTItbo2YBBpkQAYEgBAEBAQE4hDgBAQEBAgE4QAYLCxgJFAIPCQMCAQIBMRQTBgIBAYg2DalRn3IXhV2JFhaEKwEDmiGXAw
X-IPAS-Result: AmMkAMz8lFNT4zlwPGdsb2JhbAANTItbo2YBBpkQAYEgBAEBAQE4hDgBAQEBAgE4QAYLCxgJFAIPCQMCAQIBMRQTBgIBAYg2DalRn3IXhV2JFhaEKwEDmiGXAw
X-IronPort-AV: E=Sophos;i="4.98,1000,1392159600"; d="scan'208";a="595941712"
Received: from c-7039e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	[10.175.196.199]) ([83.227.57.112])
	by ipb4.telenor.se with ESMTP; 09 Jun 2014 02:18:36 +0200
Message-ID: <5394FD5B.6070700@emagii.com>
Date: Mon, 09 Jun 2014 02:18:35 +0200
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
X-List-Received-Date: Mon, 09 Jun 2014 00:18:42 -0000
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
Have managed to build meta-arago/meta-ti/meta-qt5,
and I am now running a Beaglebone Black with a 4Dsystems 4.3" LCD.

This is all black.

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

  and I can run several Qt applications, but:

Screen is all black.

I did not change any










> BR
> Ulf
>
>


