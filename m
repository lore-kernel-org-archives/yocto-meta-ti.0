Return-Path: <chgans@googlemail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E91EE0073F
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 18:59:23 -0700 (PDT)
Received: by mail-pa0-f48.google.com with SMTP id kp13so1319626pab.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 18:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=OFgVLmVq8P6bda4ggKn4pbdOB96f33JPeHlk9RwIPC8=;
	b=QRBhU1P4OCpG2tngRm0+iMf4gHQc12qZYI00pUt0u6UjzfgGlizkoymdM3U1jeH+rf
	CI2bBqJqhxzNBWW1Xyp4FFj/7fdc5XyvfAh6deNXSEmKGLi6dHQ2P+LLQWU/Q+MbJ0qb
	2knT0iujug+vnRMwzV85ZGELtKpElOmV4DrueW+nP0GNLKZwIp8c37sGprrRHK/n4V3F
	g5Jm3XWNEAsgs5ljTq87qSCyssh+0oyvqelgEKQTBRBvSP3XBmyzhNNU27dxlsez7Dpi
	d3lT2QJ9fng9+kR2ZkAEDsozalS8lAfZY8VWzkAQdv2cxoaFK7heaXYe9b4F3Jq3XADc
	07uw==
X-Received: by 10.66.156.229 with SMTP id wh5mr448825pab.156.1376618362666;
	Thu, 15 Aug 2013 18:59:22 -0700 (PDT)
Received: from [0.0.0.0] ([210.48.94.225])
	by mx.google.com with ESMTPSA id bg3sm2582170pbb.44.2013.08.15.18.59.18
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 18:59:21 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <520D8773.1050307@gna.org>
Date: Fri, 16 Aug 2013 13:59:15 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Qt/TI question
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
X-List-Received-Date: Fri, 16 Aug 2013 01:59:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

This is a bot off-topic, so if you know a better mailing list for this 
kind of things, please let me know.

I'm thinking about making a request on the qt-devel mailing list, and of 
course I am willing to provide work to get this feature working.

Qt comes with a list of supported devices [1], of which are the 
beagleboard and the pandaboard. It would be nice to have as well the 
beaglebone. A simple first step would be to add a mkspecs to the 
qt-platform-mkspec project [2].

Up to know, this is all off-topic, but:
The mkspecs simply specify compiler flags (C, CPP and LD) and point to a 
cross-toolchain. [3] is the example for omap3430.
I don't know who wrote that one, but it refers to a "beagle-narc-rootfs" 
and a Code Sourcery "arm-2010q1" (I assume it is CS because of the "q1" 
part).

And that's where meta-ti/arago could step in, because it is a 
toolchain/rootfs provider for TI SoCs.

Right now, I'm trying to build arago/dylan SDK with gles support. If it 
works, then the generated SDK could be used to allow building Qt4/5 out 
of yocto via the qt-platform-mkspecs.

Once this is showed to be working, a pull request could be made to 
qt-platform-mkspecs, and start a discussion on having the beaglebone 
added to the list of supported device and add a page on qt-project wiki 
a bit like the one for the beagleboard[4].

Any thoughts or suggestions?

Chris

[1] http://qt-project.org/wiki/Category:Devices
[2] http://gitorious.org/qt-platform-mkspecs
[3] 
http://gitorious.org/qt-platform-mkspecs/qt-platform-mkspecs/blobs/master/5.0/linux-omap3430-g++/qmake.conf
[4] http://qt-project.org/wiki/TIBeagleBoard

