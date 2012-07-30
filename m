Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB4FE0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 12:42:19 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6UJg8vI026135;
	Mon, 30 Jul 2012 14:42:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6UJg8X4023698;
	Mon, 30 Jul 2012 14:42:08 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 30 Jul 2012 14:42:08 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6UJg83k017936;
	Mon, 30 Jul 2012 14:42:08 -0500
Date: Mon, 30 Jul 2012 15:42:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <joshua.marinacci@nokia.com>
Message-ID: <20120730194207.GA23003@edge>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
	<40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
MIME-Version: 1.0
In-Reply-To: <40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
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
X-List-Received-Date: Mon, 30 Jul 2012 19:42:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 30, 2012 at 07:10:23PM +0000, joshua.marinacci@nokia.com wrote:
> Hmm. I don't see to have depmod installed.  Perhaps that is part of my 
> problem. What package would I need to add to the minimal-core-image to get 
> that?

Josh,

core-image-minimal uses busybox for tools like insmod and modprobe. The 
default configuration for busybox does not have depmod enabled. As of 
module-init-tools, they are being built, but not installed on the filesystem. 
So, you can either modify busybox config to enable depmod, or add 
module-init-tools-depmod package to your filesystem. The new way is to use 
kmod, which is available in oe-core master, or meta-oe in denzil. But oe-core 
master setup is broken for me at the moment, so I can't verify that kmod is 
included. At least it's not listed in the image/task...

Denys


> On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:
> 
> > On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
> >> This does work. When I boot the wpa stuff is included but I still don't have a network driver loaded.  If I include the built modules-3.2.19-r0-overo.tgz in my rootfs I can cd into the directory with all of the modules.  However insmod libertas.ko fails with
> >> 
> >>        insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in module, or unknown parameter
> >> 
> >> and modprobe fails with
> >> 
> >>        modprobe: module libertas not found in modules.dep
> >> 
> >> 
> >> So, what should I do to make sure the libertas module is compiled correctly, included in my kernel, and then actually used at runtime?
> > 
> > try with "depmod -a" (this must be done only once after you untar the
> > modules) before modprobe libertas.
> > 
> > I am not sure but i think it was "modprobe libertas_sdio", try that
> > too. And of course you will need the libertas firmware
> > (sd8686....bin).
> > 
> > Enrico
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

