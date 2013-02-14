Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 8F181E006C2;
	Thu, 14 Feb 2013 08:00:33 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1EG0V44029049;
	Thu, 14 Feb 2013 10:00:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1EG0VjR006437;
	Thu, 14 Feb 2013 10:00:31 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 14 Feb 2013 10:00:31 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1EG0VFV014136;
	Thu, 14 Feb 2013 10:00:31 -0600
Date: Thu, 14 Feb 2013 11:00:31 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Message-ID: <20130214160030.GD2539@edge>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Wifi Module + udev configs
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
X-List-Received-Date: Thu, 14 Feb 2013 16:00:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

There's /lib/udev/firmware which is a firmware loading helper.

The actual firmware files go into /lib/firmware/ directory.

Please make sure you have the correct packages installed with firmware for 
your WiFi - linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}

-- 
Denys


On Thu, Feb 14, 2013 at 09:17:43AM -0200, Raul Rosetto Munoz wrote:
> Yes I install this package,
> But I think that the problem is that the binary firmware at "/lib/udev"
> doesn't come with the build.
> 
> Some one know how to build the binary firmware at "/lib/udev" responsible
> to record the firmware in wifi dongle and enable the udev rules for this
> action.
> 
> Thanks for all Help
> 
> 
> 2013/2/12 Denys Dmytriyenko <denys@ti.com>
> 
> > On Thu, Feb 07, 2013 at 06:26:46PM -0200, Raul Rosetto Munoz wrote:
> > > Hello All,
> > > I need to configure my yocto project to work with wifi dongle realteck
> > > rtl8192cu.
> > >
> > > My first problem is that the module does not go up automatically
> > rtl8192cu
> > > different than Angstron distro that when I plug the dongle all modules
> > rise.
> > >
> > > Another important difference is that on Angstron distro I have on
> > /lib/udev
> > > the "firmware" binary file.  I really was not able to install this
> > > functionality in udev.
> >
> > Have you looked at linux-firmware package? rtl8192* should be well
> > supported.
> >
> >
> > > And How to make this firmware binary go to /lib/udev?
> >
> > By default, firmware files go into /lib/firmware
> >
> > --
> > Denys
> >
> 
> 
> 
> -- 
> *Raul Rosetto Mu?oz*

