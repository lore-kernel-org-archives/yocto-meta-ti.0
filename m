Return-Path: <adumaz@adeneo-embedded.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F02B9E00BBA; Tue, 10 Jun 2014 06:19:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
X-Greylist: delayed 421 seconds by postgrey-1.32 at yocto-www;
	Tue, 10 Jun 2014 06:19:01 PDT
Received: from hbg-pa71.hmc-pa.adm (smtp.adetelgroup.com [94.247.26.71])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 737B3E00B0B
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 06:19:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by hbg-pa71.hmc-pa.adm (Postfix) with ESMTP id C40AD44D16
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 15:11:59 +0200 (CEST)
Received: from hbg-pa71.hmc-pa.adm ([127.0.0.1])
	by localhost (hbg-pa71.hmc-pa.adm [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mQEu97acaQYl for <meta-ti@yoctoproject.org>;
	Tue, 10 Jun 2014 15:11:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hbg-pa71.hmc-pa.adm (Postfix) with ESMTP id 87E23448E1
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 15:11:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at hbg-pa71.hmc-pa.adm
Received: from hbg-pa71.hmc-pa.adm ([127.0.0.1])
	by localhost (hbg-pa71.hmc-pa.adm [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DBixNji4li5V for <meta-ti@yoctoproject.org>;
	Tue, 10 Jun 2014 15:11:55 +0200 (CEST)
Received: from hbg-pa74.hmc-pa.adm (unknown [10.210.21.3])
	by hbg-pa71.hmc-pa.adm (Postfix) with ESMTP id 71FCB44DCF
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 15:11:55 +0200 (CEST)
Date: Tue, 10 Jun 2014 15:11:52 +0200 (CEST)
From: DUMAZ Aymeric <adumaz@adeneo-embedded.com>
To: meta-ti@yoctoproject.org
Message-ID: <919612437.2522625.1402405912278.JavaMail.zimbra@adeneo-embedded.com>
In-Reply-To: <1777650538.2520577.1402404968526.JavaMail.zimbra@adeneo-embedded.com>
MIME-Version: 1.0
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF29 (Linux)/8.0.6_GA_5922)
Thread-Topic: Building qt5 using Yocto+meta-ti possible for Beaglebone?
Thread-Index: BDfvcRw5I5BLdkcgc8/9NQW1VAjdKQ==
Subject: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Tue, 10 Jun 2014 13:19:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Sorry if this message doesn't add to the original thread, I just suscribbed to the ML.

> 2014-06-10 02:35, Denys Dmytriyenko skrev:
>> On Tue, Jun 10, 2014 at 12:54:10AM +0200, Ulf Samuelsson wrote:
>>> 2014-06-09 12:04, Diego Sueiro skrev:
>>> I have a 4,3" LCD display and HDMI connected.
>>>
>>> "Romber Nelson" = Robert C Nelson.
>>>
>>> I replaced the  meta-ti kernel with his patched 3.8.13 kernel.
>>> If I understand this correctly, this has backported the Graphics
>>> acceleration.
>>>
>>> Made sure that kernel-modules and libgles-omap3 are included in the build.
>>> Also made sure that qtbase-5.1.1 is built with qtbaseexamples for testing.
>>>
>>> I also enabled the LCD in the bootargs.
>>>
>>> Now I get a splash screen and I can run the qt examples,
>>> but only if I supply the linux frame buffer
>>>
>>> "$ calculator"   fails, due not no X-windowa
>>>
>>> Available platform plugins are: eglfs, linuxfb, minimal, minimalegl,
>>> offscreen.
>>>
>>> "$ calculator -platform linuxfb" works, but is of course not accelerated.
>>>
>>> "$ calculator -platform eglfs" fails.
>>>
>>> Could not initialize egl display
>>> EGL error
>>> Aborted
>> IIRC, there were some additional patches for libgles-omap3 and Qt5 in
>> meta-arago... I don't remember the version of Qt5 when I played with it and
>> got it working - it was either 5.1.1 or 5.2...
>
> meta-arago (dora) has 5.1.1
> master has 5.2.0
>
> meta-qt5 uses 5.2.1

I'm using an AM335x-evmsk and I get the same errors about EGL.
I just checked the patches on the master branch of meta-arago; turns out
it's not for 5.2.0!
In fact, you can find the same patches inside the "qt5_1_1_Sep13" folder
here: https://github.com/prabindh/qt-configs
I tried to see if I could adapt them but the source changed too much between
5.1 and 5.2.

