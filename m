Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4088E013EC
	for <meta-ti@yoctoproject.org>; Sat, 27 Jul 2013 01:05:55 -0700 (PDT)
Received: by mail-pa0-f48.google.com with SMTP id kp13so2826448pab.35
	for <meta-ti@yoctoproject.org>; Sat, 27 Jul 2013 01:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=gqo8eE/SZcHDUbnTSkNW9P63VoUaliX1GGEHXQ9otDQ=;
	b=dqvu3Jx9B1nC9QHpQ+vkFYvlyegOD9Pe/AjpIkzwHyP8jKhr7Yyt+PVVptJ5Hdk0Xa
	kjYwTFsjk2sD1UNWebrh0x4tFcrEEKfv2bE7+YEPQbX92M/ZrGGj+GWDzRCtkMo7xpCk
	nkC+L/m++yWQdlOw1hjlXHhjQ1FdE4cndB274iD4m7BlHVDXz0PTBrsV7QL8UpCZpw3T
	oEODGIlIpOoKUuoq68Y0QqWl1Kbe9EdDbKJLA6lJBT5SABhg4rhlL5ywclyj4V+l+VqO
	CDJityigMqhlWHOTTclNVUXNdjBSFI6pHuAt2P68yul/RBruVWIuzro7EyPRvMYCMqHV
	foPQ==
X-Received: by 10.66.50.104 with SMTP id b8mr59417950pao.39.1374912354841;
	Sat, 27 Jul 2013 01:05:54 -0700 (PDT)
Received: from linux-z8sp.site ([121.99.46.34])
	by mx.google.com with ESMTPSA id
	xl3sm64574193pbb.17.2013.07.27.01.05.51 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Jul 2013 01:05:53 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51F42820.9010104@gna.org>
Date: Sun, 28 Jul 2013 08:05:52 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <51F1AA6E.4050607@gna.org> <20130726210641.GF3558@edge>
	<321768C95D21724485BCE784F1BE98473EB80C27@DBDE04.ent.ti.com>
	<51F3E4AD.8070201@gna.org> <20130727034153.GG3558@edge>
In-Reply-To: <20130727034153.GG3558@edge>
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
X-List-Received-Date: Sat, 27 Jul 2013 08:05:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/27/2013 03:41 PM, Denys Dmytriyenko wrote:
> On Sun, Jul 28, 2013 at 03:18:05AM +1200, Christian Gagneraud wrote:
>> On 07/27/2013 02:20 PM, Sundareson, Prabindh wrote:
>>> The device approach is useful for adding platform specific hooks for
>>> eglfs via EGLFS_PLATFORM_HOOKS_SOURCES, so it is a good thing. So it is
>>> more of a convenience/cleaner way, than anything related to performance.
>>>
>>
>> I do agree with Dennys about the compiler flags, yocto knows what
>> are the best flags for the machine/device.
>> What is nice with the device file approach is the specification for
>> OpenGL includes, libs, QPA and the EGLFS hooks as well.
>> Basically I like the fact that all the OpenGL "mess" is sorted out
>> in one place (when it comes to compilation).
>> Interesting examples are the Rasberry Pi [1] and Freescale i.mx6 [2].
>>
>> when considering Qt alone (out of Yocto/OE), I think as a SoC
>> vendor, it is the best way to make sure your users get the best of
>> Qt5/OpenGL, and very easily according to [3] (not tested).
>>
>>
>> When it comes to Yocto, I didn't see any easy way for meta-bsp to
>> tell meta-qt5 how to configure/build qt5 w/ OpenGL support.
>> It seems to me that the only way is through the .bbappend, in qtbase.inc:
>> [...]
>> # if you want to enable egl/gles2 in your .bbappend, don't forget to
>> add right dependencies, e.g.
>> # GL_DEPENDS = "virtual/libgles2 virtual/egl"
>> # QT_GLFLAGS = "-opengl es2 -eglfs"
>> GL_DEPENDS ?= "virtual/libgl"
>> QT_GLFLAGS ?= "-opengl"
>> [...]
>>
>> Could/should this be used by the meta-ti layer?
>>
>> I spent some time recently going through meta-qt5 recently (as well
>> as the qt4 stuff), I even tried an alternative configure/method, so
>> far unsuccessfully. My feeling is that meta-qt5 tries to adapt qt5
>> to OE, I think it should be done the other way around, that's my
>> very personal view.
>>
>> I really would like to see a Yocto Qt5 SDK one of these days.
>>
>> Prabindh, could you tell more about the status of Qt5/OpenGL for TI
>> SoCs, what about this commit [4]? Is it possible to build within
>> Yocto Qt5 w/ OpenGL support for AM335x platforms?
>
> Have you seen this thread:
> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2139

No I haven't up to now, thanks for the link.

Regards,
Chris

>


