Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B01F7E01405
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 20:18:07 -0700 (PDT)
Received: by mail-pa0-f45.google.com with SMTP id bg4so3900120pad.4
	for <meta-ti@yoctoproject.org>; Fri, 26 Jul 2013 20:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ePQhsMBbwUqBaVBEx3BtkERr1KuVbtzbHwG4PRSLXOA=;
	b=uO0fueYqKzl7z5TFvBmijVen/kLfWlMJEO0ShixROp9jiAUG99hUrkRj47lq9adiwp
	q4poyzNfdpmuR+Xee/hcG72Zl/e2EaiohqwbKiEr0K7+jI1OSeC4ot07mN00kzOe2eh3
	8iA+EdS/9eckdckfx5URM+qYA7pn7QPI9pT6QnS8FQYfoHfGfuqGhWGMyC5iNE4xRszJ
	aRqLY3FLWqHEeAZaxS4WGUkClqoSPxQynLT6yfs9xYj8kxanXw2BrGnuPRFtprP4BDwm
	XO2a4gR32OBzFYVM3B/suaXm1HRUCyEAw09uxYmm132cGR1hMzPOB3czrOgDhRr4wXrK
	AOeQ==
X-Received: by 10.66.232.101 with SMTP id tn5mr52687653pac.132.1374895087547; 
	Fri, 26 Jul 2013 20:18:07 -0700 (PDT)
Received: from linux-z8sp.site ([121.99.46.34])
	by mx.google.com with ESMTPSA id sz3sm34869079pbc.5.2013.07.26.20.18.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 20:18:06 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51F3E4AD.8070201@gna.org>
Date: Sun, 28 Jul 2013 03:18:05 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Sundareson, Prabindh" <prabu@ti.com>
References: <51F1AA6E.4050607@gna.org>, <20130726210641.GF3558@edge>
	<321768C95D21724485BCE784F1BE98473EB80C27@DBDE04.ent.ti.com>
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB80C27@DBDE04.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [Qt5] mkspecs/devices: beagleboard == am335x ?
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
X-List-Received-Date: Sat, 27 Jul 2013 03:18:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2013 02:20 PM, Sundareson, Prabindh wrote:
> The device approach is useful for adding platform specific hooks for
> eglfs via EGLFS_PLATFORM_HOOKS_SOURCES, so it is a good thing. So it is
> more of a convenience/cleaner way, than anything related to performance.
>

I do agree with Dennys about the compiler flags, yocto knows what are 
the best flags for the machine/device.
What is nice with the device file approach is the specification for 
OpenGL includes, libs, QPA and the EGLFS hooks as well.
Basically I like the fact that all the OpenGL "mess" is sorted out in 
one place (when it comes to compilation).
Interesting examples are the Rasberry Pi [1] and Freescale i.mx6 [2].

when considering Qt alone (out of Yocto/OE), I think as a SoC vendor, it 
is the best way to make sure your users get the best of Qt5/OpenGL, and 
very easily according to [3] (not tested).


When it comes to Yocto, I didn't see any easy way for meta-bsp to tell 
meta-qt5 how to configure/build qt5 w/ OpenGL support.
It seems to me that the only way is through the .bbappend, in qtbase.inc:
[...]
# if you want to enable egl/gles2 in your .bbappend, don't forget to add 
right dependencies, e.g.
# GL_DEPENDS = "virtual/libgles2 virtual/egl"
# QT_GLFLAGS = "-opengl es2 -eglfs"
GL_DEPENDS ?= "virtual/libgl"
QT_GLFLAGS ?= "-opengl"
[...]

Could/should this be used by the meta-ti layer?

I spent some time recently going through meta-qt5 recently (as well as 
the qt4 stuff), I even tried an alternative configure/method, so far 
unsuccessfully. My feeling is that meta-qt5 tries to adapt qt5 to OE, I 
think it should be done the other way around, that's my very personal view.

I really would like to see a Yocto Qt5 SDK one of these days.

Prabindh, could you tell more about the status of Qt5/OpenGL for TI 
SoCs, what about this commit [4]? Is it possible to build within Yocto 
Qt5 w/ OpenGL support for AM335x platforms?

Regards,
Chris

[1] 
http://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-rasp-pi-g++
[2] 
http://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-imx6-g++
[3] 
http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
[4] 
https://github.com/prabindh/meta-qt5/commit/c8129fb5057f9254c773f82d2fdbd85d9c56410a


>
> regards
> Prabindh
> ________________________________________
> From: meta-ti-bounces@yoctoproject.org [meta-ti-bounces@yoctoproject.org] on behalf of Dmytriyenko, Denys
> Sent: Saturday, July 27, 2013 2:36 AM
> To: Christian Gagneraud
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [Qt5] mkspecs/devices: beagleboard == am335x ?
>
> On Fri, Jul 26, 2013 at 10:45:02AM +1200, Christian Gagneraud wrote:
>> Hi there,
>>
>> In qtbase sources, there are a couple of "device" definitions files,
>> according to [1], this greatly help cross-compiling qt5.
>> This device file specify things for CPU and GPU optimisations. So
>> basically these files are tightly coupled with BSP providers.
>>
>> One of them is linux-beagleboard-g++ [2], is it appropriate to use
>> this one for AM335x based platform as well?
>>
>> The meta-qt5 layer doesn't seem to use this feature, but if it did,
>> would this device config files help to get an optimised Qt5 build
>> for TI SoCs? Especially, would that help to get OpenGL stuff sorted
>> out?
>>
>> Regards,
>> Chris
>>
>> [1] http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
>> [2] https://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-beagleboard-g++
>
> Chris,
>
> Looking at those files shows very basic compiler optimization flags being set,
> -march, -mtune, -mfpu etc. I don't see any GL or GPU specifics in there. It
> also hardcodes things like soft-fp, which is not good. All this stuff is
> alredy taken care of by the build framework and I'm sure meta-qt5, like the
> old qt4, sets all the right COMPILER_FLAGS to get the most performance from
> the target CPU.
>
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>


