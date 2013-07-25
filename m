Return-Path: <chgans@googlemail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 67BE6E014E4
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2013 15:45:07 -0700 (PDT)
Received: by mail-pd0-f182.google.com with SMTP id r10so2227277pdi.27
	for <meta-ti@yoctoproject.org>; Thu, 25 Jul 2013 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=hl7xRGJJV9Assg9Eo+f9xuOwtEWj92VllPLJn2IhGfs=;
	b=Kb1hqv/Ln36wZ4QSVLIWLyHuIoMj9Nr25Yizu4Zd2NC3L7wi29ZxPO7wvgS9vSy9T+
	Hc8ceFpo33ucpOTZmQZaOKgAc7b8OPXBcNJv2M4fVaISOVQb5tCF6+WqsbE9J/nHWDWB
	s1jNfX5nyl3krk7XO+hxfM+FvACqeOQYe2DVt0v7BKXsI7WSjdYwv2pUL5Fww/lzKJlo
	ZC8DI1mFN4dJQSXQJxvMZgOAFoiJ+OsZhUi10/jSRv6DYFn5DC/3pvWjVO06Pul4g8qs
	xnCvxPsveia79HWwLpaud39c1xFeNjo1U+vaJQji/PRn1py8HFIY9SsWSN7fVJRDb4Iz
	Eicw==
X-Received: by 10.66.248.164 with SMTP id yn4mr52154895pac.153.1374792307247; 
	Thu, 25 Jul 2013 15:45:07 -0700 (PDT)
Received: from krys-red.trunet.local ([210.48.94.225])
	by mx.google.com with ESMTPSA id ai6sm391216pad.15.2013.07.25.15.45.04
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 25 Jul 2013 15:45:06 -0700 (PDT)
Sender: Chris Gagneraud <chgans@googlemail.com>
Message-ID: <51F1AA6E.4050607@gna.org>
Date: Fri, 26 Jul 2013 10:45:02 +1200
From: Christian Gagneraud <chgans@gna.org>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: [Qt5] mkspecs/devices: beagleboard == am335x ?
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
X-List-Received-Date: Thu, 25 Jul 2013 22:45:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

In qtbase sources, there are a couple of "device" definitions files, 
according to [1], this greatly help cross-compiling qt5.
This device file specify things for CPU and GPU optimisations. So 
basically these files are tightly coupled with BSP providers.

One of them is linux-beagleboard-g++ [2], is it appropriate to use this 
one for AM335x based platform as well?

The meta-qt5 layer doesn't seem to use this feature, but if it did, 
would this device config files help to get an optimised Qt5 build for TI 
SoCs? Especially, would that help to get OpenGL stuff sorted out?

Regards,
Chris

[1] 
http://blog.qt.digia.com/blog/2012/04/13/cross-compiling-qt-for-the-masses/
[2] 
https://qt.gitorious.org/qt/qtbase/trees/stable/mkspecs/devices/linux-beagleboard-g++

