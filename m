Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 734E7E003BC
	for <meta-ti@yoctoproject.org>; Wed, 20 Feb 2013 22:11:20 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1L6BIoR021102;
	Thu, 21 Feb 2013 00:11:18 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1L6BIi2032320;
	Thu, 21 Feb 2013 00:11:18 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 21 Feb 2013 00:11:18 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1L6BHK3030949;
	Thu, 21 Feb 2013 00:11:18 -0600
Date: Thu, 21 Feb 2013 01:11:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nick G <exosyst+metaTI@gmail.com>
Message-ID: <20130221061117.GD14111@edge>
References: <CAN-pQASFihdOs3W9L1i-t3niFNUWZv9t_iqyGdj0sRsRMMGAsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAN-pQASFihdOs3W9L1i-t3niFNUWZv9t_iqyGdj0sRsRMMGAsw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: U-Boot misconfiguration
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
X-List-Received-Date: Thu, 21 Feb 2013 06:11:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 19, 2013 at 03:04:52PM +0000, Nick G wrote:
> Hey guys,
> 
> I mentioned this in IRC yesterday but thought it was worth making it better
> known including the workaround.

Yes, as I mentioned on IRC, there's 2012.10 available from meta-arago, that we 
would need to "release" to meta-ti eventually.


> Checking out the danny branch for both poky and meta-ti and setting the
> MACHINE to beaglebone fails to build a suitable version of uboot when
> performing a bitbake -k core-image-minimal
> 
> The error output is:
> make: *** No rule to make target `am335x_evm_config'.  Stop.
> make: *** [am335x_evm_config] Error 1
> 
> If you navigate to the build directory you can see that it tries to build
> u-boot-v2011.06 which I understand has no support for the am335x. The
> earliest supported build being 2011.09.
> 
> To get around this you can add:
> PREFERRED_VERSION_u-boot = "2011.09+git"
> 
> to your local.conf.
> 
> Is there an official bugtracker to file against this and a better way to
> add the fix/workaround to the danny layer?
> 
> Regards,
> Nick

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


