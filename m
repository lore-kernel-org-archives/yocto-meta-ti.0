Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE7EAE016B3
	for <meta-ti@yoctoproject.org>; Thu, 17 Oct 2013 14:45:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9HLjTvg020013;
	Thu, 17 Oct 2013 16:45:29 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HLjT5c018420;
	Thu, 17 Oct 2013 16:45:29 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 17 Oct 2013 16:45:29 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9HLjTKu026782;
	Thu, 17 Oct 2013 16:45:29 -0500
Date: Thu, 17 Oct 2013 17:45:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-ID: <20131017214528.GC30989@edge>
References: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+gsK-p49VYtzviOwgtzssxxXnAS4Eku0Y95bsFL5LvT+v=9Sw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335x EVM and core-image-sato
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
X-List-Received-Date: Thu, 17 Oct 2013 21:45:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Oct 17, 2013 at 02:29:49PM -0700, Rudolf Streif wrote:
> I built a core-image-sato for the AM335x EVM. The image boots into the
> command line. X does not work. There is no frame buffer device (/dev/fb0).

I haven't tried X here, but I was able to get the framebuffer working on a 
more recent build of 3.12-rc4 and there was /dev/fb0 available. I was running 
Qt5-based app on it using linuxfb QPA output plugin.


> /lib/modules/3.12.0-rc3/kernel/dirvers/video/omap2/omapfb contains an
> omapfb kernel module. However, "modprobing" it results in ERROR: Could not
> insert 'omapfb': No such device.
> 
> I suppose I am missing something here but what?
> 
> Thanks,
> Rudi

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


