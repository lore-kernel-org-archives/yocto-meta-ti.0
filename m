Return-Path: <chgans@googlemail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3525E01412
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 21:34:04 -0700 (PDT)
Received: by mail-pd0-f181.google.com with SMTP id g10so1706588pdj.26
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 21:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=PN0vha8FVQSBz8lBeptZFGfJdZnNHqQpSLIARAY11d0=;
	b=ZBcjWZ7ekJZwtxCSzmC+ga8iV3xVO2XMFLRJgF6kzD/6SToqHwGGg7gdfNQY1S5Loo
	TCMgRgUcfPg8toYhZKMBe0/uaOQ1ixJPQHRtXGSikPlPL8OjrtIky0pYYPgehRZIqlhO
	NqZtMBa1JN9iuKJLGz+k8PDmZq03IuN/ScTo0E5lvAPmEMf54jJ1IJPGo0PBcSx0JqNY
	ar9nRbrQHaX1af76T1m+PZ+1Uqht+PtZzrfaCg5fvvpv08UxtYnKGouYJtsuCDFw2g4V
	JtJHELA5/sQXTQ/IP1onqc8umNUDAtDadzIwLXEbxfghKN+tb4VPV+bPcHPdv2TyKqPU
	O0Yw==
X-Received: by 10.66.196.110 with SMTP id il14mr1013459pac.130.1376627644774; 
	Thu, 15 Aug 2013 21:34:04 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id oj6sm664030pab.9.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 21:34:03 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520DABB8.90505@gna.org>
Date: Fri, 16 Aug 2013 16:34:00 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Sundareson, Prabindh" <prabu@ti.com>
References: <520D8773.1050307@gna.org>
	<321768C95D21724485BCE784F1BE98473EB96F06@DBDE04.ent.ti.com>
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB96F06@DBDE04.ent.ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Qt/TI question
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
X-List-Received-Date: Fri, 16 Aug 2013 04:34:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/08/13 14:37, Sundareson, Prabindh wrote:
> Yes - that would be the goal, and we can review the patches as well.
>
> The meta-qt5 recipes will also be changed, so ensure they are copied in the discussions,

Hi Prabu,

To start with, I was thinking to keep meta-qt5 aside, I have expressed 
my personal opinion about meta-qt5 before [1], basically I expressed the 
feeling that meta-qt5 try to adapt Qt to OE, instead of the other way 
around, currently qtbase needs 19 patches, of which lot of heavy 
modification to the Qt build process. Again this is my personal opinion, 
and i don't have materials yet to support my point.

Once the beaglebone page has been created on qt-project, it could be 
used to show that the best approach is to provide machine/SoC optimised 
mkspec and try not to patch Qt5 so heavily.

As well, I started to work on a yocto plugin for QtCreator, I'm using 
the Android and the BlackBerry/QNX plugins as references, but I am still 
at a very early stage:
Right now, it's just parsing the env and version files and provide a 
QtCreator GnuToolchain, the road is very long, I have next to provide a 
GdbSomething, a QtVersionSomething, a DeployOnTheTargetStuff, a 
KitThingy and many other classes.

The problem right now with the env script and the generically named 
mkspec is that to be able to configure QtCreator to use a yocto SDK, you 
have to source a file and run qtcreator form there, and then only you 
can configure it step by step and finally be able to build a project. 
This way of doing specialises your qtcreator session (not talking about 
the step by step configuration, just0 the build).
I never managed to build a project for different Yocto SDK without 
having to quit QtCreator, source another env file and run QtCreator again...

Anyway, I'm very open on the best approach with meta-qt5.

Last thing, please note as well, that I don't have much time to spend on 
this (read: these days at work), but I'm working on getting N weeks 
full-time, will see how high is the N! :)

[1] https://lists.yoctoproject.org/pipermail/meta-ti/2013-July/003092.html


>
> regards,
> Prabu
>
>
> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Christian Gagneraud
> Sent: Friday, August 16, 2013 7:29 AM
> To: meta-ti@yoctoproject.org
> Subject: [meta-ti] Qt/TI question
>
> Hi there,
>
> This is a bot off-topic, so if you know a better mailing list for this kind of things, please let me know.
>
> I'm thinking about making a request on the qt-devel mailing list, and of course I am willing to provide work to get this feature working.
>
> Qt comes with a list of supported devices [1], of which are the beagleboard and the pandaboard. It would be nice to have as well the beaglebone. A simple first step would be to add a mkspecs to the qt-platform-mkspec project [2].
>
> Up to know, this is all off-topic, but:
> The mkspecs simply specify compiler flags (C, CPP and LD) and point to a cross-toolchain. [3] is the example for omap3430.
> I don't know who wrote that one, but it refers to a "beagle-narc-rootfs"
> and a Code Sourcery "arm-2010q1" (I assume it is CS because of the "q1"
> part).
>
> And that's where meta-ti/arago could step in, because it is a toolchain/rootfs provider for TI SoCs.
>
> Right now, I'm trying to build arago/dylan SDK with gles support. If it works, then the generated SDK could be used to allow building Qt4/5 out of yocto via the qt-platform-mkspecs.
>
> Once this is showed to be working, a pull request could be made to qt-platform-mkspecs, and start a discussion on having the beaglebone added to the list of supported device and add a page on qt-project wiki a bit like the one for the beagleboard[4].
>
> Any thoughts or suggestions?
>
> Chris
>
> [1] http://qt-project.org/wiki/Category:Devices
> [2] http://gitorious.org/qt-platform-mkspecs
> [3]
> http://gitorious.org/qt-platform-mkspecs/qt-platform-mkspecs/blobs/master/5.0/linux-omap3430-g++/qmake.conf
> [4] http://qt-project.org/wiki/TIBeagleBoard
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>


