Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30F46E00519; Wed,  8 Mar 2017 00:10:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_00,LONGWORDS
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  2.0 LONGWORDS Long string of long words
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DBBDE00519
	for <meta-ti@yoctoproject.org>; Wed,  8 Mar 2017 00:10:21 -0800 (PST)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 2300D68A019; Wed,  8 Mar 2017 08:10:20 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id BE53D68A019;
	Wed,  8 Mar 2017 08:10:18 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 6C63F67403E8;
	Wed,  8 Mar 2017 09:10:18 +0100 (CET)
To: meta-ti@yoctoproject.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <c8ccbb2d-d31b-7f5c-e002-afe69980dd86@mlbassoc.com>
Date: Wed, 8 Mar 2017 09:10:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: Getting TI tools into [host] SDK
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
X-List-Received-Date: Wed, 08 Mar 2017 08:10:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to build a [host] SDK for my target which uses some
TI tools, via -c populate_sdk_ext

In particular, I'm using recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
I include ti-cgt-pru-native to use the tools in my bitbake recipes - that works fine.
I include ti-cgt-pru in my target image to get the tools on my board - that also works.

The problem is that in my SDK, none of the binaries are included, including clpru:

$ ls -l /home/gthomas/my_ti_sdk/tmp/sysroots/rainier-p8701/usr/share/ti/cgt-pru
total 16
drwxrwxr-x 2 gthomas gthomas 12288 Mar  8 08:22 include
drwxrwxr-x 3 gthomas gthomas  4096 Mar  8 08:22 lib

I added this to try and include the files:
   TOOLCHAIN_HOST_TASK += "'nativesdk-ti-cgt-pru"
and I can see that there was a nativesdk-ti-cgt-pru built which does have all the
executables included, they just aren't being packaged.

$ ls 
tmp/work/x86_64-nativesdk-mysdk-linux/nativesdk-ti-cgt-pru/2.1.4-r0/image/opt/mydistro/2.2+snapshot/sysroots/x86_64-amltdsdk-linux/usr/share/ti/cgt-pru/bin
abspru    arpru   cgpru     clpru   dispru    hexpru  libinfopru  nmpru   optpru    xrefpru
acpiapru  asmpru  clistpru  dempru  embedpru  ilkpru  lnkpru      ofdpru  strippru

Any ideas on what I need to do to get the binary executables into my SDK?

Note: I copied just those (bin) files into my SDK target sysroot usr/bin and the compiler
runs just fine.  I just need to figure out the recipe magic to make this happen.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

