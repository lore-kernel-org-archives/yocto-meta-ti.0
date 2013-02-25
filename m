Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id 44A2EE00429
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 10:28:05 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1PIRxGH013307;
	Mon, 25 Feb 2013 12:27:59 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1PIRxBo010567;
	Mon, 25 Feb 2013 12:27:59 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 25 Feb 2013 12:27:59 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1PIRwh7011527;
	Mon, 25 Feb 2013 12:27:58 -0600
Date: Mon, 25 Feb 2013 13:27:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130225182757.GC16247@edge>
References: <46F9BF9187AF5A4AA0AEF94A28ADD22488C678@sestoex09.enea.se>
	<512613C9.5040902@communistcode.co.uk>
	<51261426.1050809@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <51261426.1050809@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: LICENSE related errors while using meta-ti layer
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
X-List-Received-Date: Mon, 25 Feb 2013 18:28:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 21, 2013 at 12:33:42PM +0000, Jack Mitchell wrote:
> On 21/02/13 12:32, Jack Mitchell wrote:
> >On 21/02/13 12:29, Maxin John wrote:
> >>Hi,
> >>
> >>While trying to build core-image-minimal for "hawkboard" using poky
> >>and meta-ti layers (master branch), I get the below listed error:
> >>
> >>:~/master/poky/build$ bitbake core-image-minimal
> >>ERROR: This recipe does not have the LICENSE field set
> >>(cloud9-gnome-image)
> >>ERROR: This recipe does not have the LICENSE field set (cloud9-image)
> >>ERROR: Unable to parse
> >>/home/majo/master/poky/meta-ti/recipes-misc/images/cloud9-gnome-image.bb:
> >>
> >>Exited with "1"
> >>ERROR: This recipe does not have the LICENSE field set
> >>(cloud9-gfx-image)
> >>ERROR: This recipe does not have the LICENSE field set
> >>(ti-hw-bringup-image)
> >>ERROR: Command execution failed: Exited with 1
> >>
> >>Is it safe to assume "MIT" LICENSE for these recipes ?
> >>
> >>Best Regards,
> >>Maxin B. John
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> >
> >Take a look at the README in the meta-ti layer.
> >
> 
> Appologies it seems the README has been changed. Some of these
> recipes need to be masked in order to get them to build.

Well, I'm not sure which change did you have in mind, but the related one is 
still there and is the last one to README:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/README?id=be837d63a43e61b9a1d183daee0cbd4ffe8a4130

-- 
Denys

