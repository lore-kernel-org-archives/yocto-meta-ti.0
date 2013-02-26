Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 641E2E00312
	for <meta-ti@yoctoproject.org>; Tue, 26 Feb 2013 13:22:31 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU00DV0JD71992@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 26 Feb 2013 15:22:31 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CA82E20092; Tue,
	26 Feb 2013 16:22:19 -0500 (EST)
Date: Tue, 26 Feb 2013 16:22:19 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-id: <20130226212219.GP6725@denix.org>
References: <1361903920-16650-1-git-send-email-m-karicheri2@ti.com>
	<512D0217.7090100@ti.com> <20130226192023.GL6725@denix.org>
	<512D0D9F.8050705@ti.com> <512D12D0.7090804@ti.com>
	<512D1714.6040805@ti.com>
	<512D1A7F.7030806@ti.com> <512D1D2B.7080909@ti.com>
MIME-version: 1.0
In-reply-to: <512D1D2B.7080909@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Tom Rini <trini@ti.com>, meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipe: u-boot: update recipe for more images
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
X-List-Received-Date: Tue, 26 Feb 2013 21:22:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 26, 2013 at 03:38:03PM -0500, Carlos Hernandez wrote:
> On 02/26/2013 03:26 PM, Tom Rini wrote:
> >On 02/26/2013 03:12 PM, Cyril Chemparathy wrote:
> >>On 02/26/2013 02:53 PM, Murali Karicheri wrote:
> >>>+ Cyril,
> >>>
> >>>Cyril had worked on adding GPH format for u-boot. Want to hear from him
> >>>why not used the u-boot-with-spl.bin build target.
> >>>
> >>Because u-boot-with-spl.bin does not wrap the spl image with a header
> >>that the rom bootloader understands.
> >What is the header we need?  I assume it's not compatible with our
> >previous headers.  And if it's just a convenience for programming the
> >flash, maybe we just stick with two files, to avoid further headaches
> >upstream?  It's a general rule that concatenating files would make
> >programming easier, but it's a small savings on either end, yes?  This
> >would also make the packaging easier since it would just be
> >SPL_IMAGE_FILE (or whatever) set to u-boot-spl.gph and so forth.  Thanks!
> >
> I believe this is what the patch I submitted (to meta-arago) few
> days ago do.
> You need to define SPL_UART_BINARY in your recipe to enable the
> extra do_install and do_deploy functionality.

Correct, but it doesn't support GPH yet, only SPL, AFAIK. Can you look into 
extending it in such a way it can be used for any/all of the use cases easily?

-- 
Denys

