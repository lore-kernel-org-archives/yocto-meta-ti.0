Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BA2CE00346
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 11:09:47 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7LI9i2P011504;
	Tue, 21 Aug 2012 13:09:44 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7LI9iDA003163;
	Tue, 21 Aug 2012 13:09:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 21 Aug 2012 13:09:44 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q7LI9i3h030593;
	Tue, 21 Aug 2012 13:09:44 -0500
Date: Tue, 21 Aug 2012 14:09:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <jakes2@ovi.com>
Message-ID: <20120821180942.GB7636@edge>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linaro and CS ABI compatibility
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
X-List-Received-Date: Tue, 21 Aug 2012 18:09:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2012 at 12:45:27AM -0700, jakes2@ovi.com wrote:
> Hello all,
> 
> As we all know, the Graphics SDK from TI is done with CodeSourcery's 
> toolchain and Yoctoproject prefers to use Linaro. So, here's the question:

It depends on the version - recent Graphics SDKs were built using so called 
"Arago" toolchain, which is a gcc-4.5.3 based toolchain with Linaro patches 
applied and made form Classic-OE/Arago.

BTW, Yocto Project prefers self-built toolchain, although you can easily add 
Linaro toolchain with meta-linaro layer.


> If I copy binaries from Imagination or TI's SDKs to my Yoctoproject - will 
> the binary libs a)work or b)is there some known restriction not to use 'em 
> c)we don't know - try it out.

As long as you use the same ABI, things should just work for the most part.

-- 
Denys

