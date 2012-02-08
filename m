Return-Path: <jfabernathy@gmail.com>
Received: from mail-yw0-f48.google.com (mail-yw0-f48.google.com
	[209.85.213.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F0CCE0059B
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 13:58:48 -0800 (PST)
Received: by yhjj52 with SMTP id j52so693240yhj.35
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 13:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=UYWeucgH0mVUxlGX055Ks22eLZjA0BEoG/ilRPRGHLM=;
	b=S7t2/sBi9vH0sIJ/5Gb0h1AdNtLb8v+9rAd/rQLuS41DkBFg6AEJBncSGOszUSfNHi
	8vFp7RDI0Abk9tN9Ol8jX34pLvrg7cuafdwY/oVUyV4raLR3DwdDJffeWr88ZvGEU+Wr
	MgUaVBWOzisep9Chp6hZZIIuBl9mcW0idsPNE=
Received: by 10.236.175.164 with SMTP id z24mr39020449yhl.84.1328738327185;
	Wed, 08 Feb 2012 13:58:47 -0800 (PST)
Received: from [10.0.1.54] (nc-184-3-54-63.dhcp.embarqhsd.net. [184.3.54.63])
	by mx.google.com with ESMTPS id q55sm892689yhi.0.2012.02.08.13.58.46
	(version=SSLv3 cipher=OTHER); Wed, 08 Feb 2012 13:58:46 -0800 (PST)
Message-ID: <4F32F016.4020008@gmail.com>
Date: Wed, 08 Feb 2012 16:58:46 -0500
From: jfabernathy <jfabernathy@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 21:58:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to build the pandaboard BSP for Yocto.  I cloned the meta-ti 
repository in the poky directory and tried to build core-image-sato for 
both machine pandaboard and omap4430-panda. However, I immediately get 
an error because bitbake is looking for 
recipes-images/angstrom/systemd-image.bb, which is required in the 
ti-hw-bringup-image.bb image recipe.

All I really included was the machine name change in local.conf and 
added the meta-ti layer in bblayers.conf.

Did I miss a step?

Jim A

