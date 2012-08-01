Return-Path: <tom.rini@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71914E013BB
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 12:12:06 -0700 (PDT)
Received: by pbbrq8 with SMTP id rq8so1788648pbb.35
	for <meta-ti@yoctoproject.org>; Wed, 01 Aug 2012 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=lhK2w0seubrWX1hWwbdIid1ktiV5EMCugZOKh0pGSxY=;
	b=gk5HH5GZ401IWlvcXXYaUQQ04+mHXSve+nDSfSlZUjwxvRjRPIBmTvyaIPsSukjHyQ
	oOS90NADle0LepF75bIm0Nl439dXxe1t2ht22rM9CrfIeNM3J133uUa1z5lW63mIN/o9
	ZKyGeDZuHvQV8zV/8eMGD0eaVqpCFjDuHyGQXZRVpNeMLMaU019M0Egb0llB4bmbwtMe
	0QRZG5nkkFzSghDm1+NN6MYjkzLnStm1YG7LWcQnZpPw/J6Wcq1xn2L0QsSekEqAFTpF
	zyuqookiiEzDvsAQxJNCiqx9k/BU+4mCDIuABzKe2o4RonxxVOPnoQP9Sq3wy1+HfdB1
	5Ong==
Received: by 10.68.203.40 with SMTP id kn8mr53854238pbc.162.1343848326024;
	Wed, 01 Aug 2012 12:12:06 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:253d:1427:ed82:5656])
	by mx.google.com with ESMTPS id rs4sm3123250pbc.0.2012.08.01.12.12.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 12:12:05 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Wed, 1 Aug 2012 12:12:14 -0700
From: Tom Rini <trini@ti.com>
To: "Kridner, Jason" <jdk@ti.com>
Message-ID: <20120801191214.GD16076@bill-the-cat>
References: <20120726013212.1F5DA52AA6@arago-project.org>
	<CC361C01.B0548%jdk@ti.com>
MIME-Version: 1.0
In-Reply-To: <CC361C01.B0548%jdk@ti.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Wed, 01 Aug 2012 19:12:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 26, 2012 at 01:57:27AM +0000, Kridner, Jason wrote:
> 
> -----Original Message-----
> From: Arago Project git <git@arago-project.org>
> Date: Wednesday, July 25, 2012 9:32 PM
> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
> Subject: [meta-ti] Koen Kooi : u-boot 2011.09+git: update to latest
> version	of Tom Rini's tree
> 
> >Module: meta-ti
> >Branch: master
> >Commit: e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66
> >URL:    
> >http://arago-project.org/git/meta-ti.git?a=commit;h=e1b4ab72cfb3ea4599701d
> >1600c44fe3c5f8ba66
> >
> >Author: Koen Kooi <koen@dominion.thruhere.net>
> >Date:   Wed Jul 11 11:53:27 2012 +0200
> >
> >u-boot 2011.09+git: update to latest version of Tom Rini's tree
> 
> Aren't all of Tom's patches upstream now?  Why not pull from the latest
> u-boot release? Are we carrying any patches that would be accepted
> upstream?

Late to the party, I know.  v2012.07 has extremely minimal support for
am335x platforms.  With 3 series of patches (which I expect to queue up
and push along to u-boot-arm and then u-boot proper) mainline support
should be better, at least wrt bone, than the arago tree.  NAND and SPI
and MMC1 won't be there, yet.  i2c, ethernet, booting kernels will be
there.  And easier than arago eeprom programming will be there too
(eeprom command in U-Boot for dumping memory to eeprom).

-- 
Tom

