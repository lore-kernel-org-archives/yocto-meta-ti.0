Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0ABEDE0098A; Mon, 27 Mar 2017 11:36:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B97C2E00887
	for <meta-ti@yoctoproject.org>; Mon, 27 Mar 2017 11:36:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RIa9Cb023070;
	Mon, 27 Mar 2017 13:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490639769;
	bh=cFsPcSiODU13caBvLgj1M0YRt0G8QH6h8C1Td/YQKIc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ZwYquocyTO4NhzC0syulSsPqhKn9zxyytyCk5SXZORUN7UmrPkvNeWqrxQPbsrNMs
	zXLFDgF5mBvrV3v1YjbfFk76XXVBYNFH5la14WcoWQ6CwVgiyEPiAKn5K1R9vF7dCv
	dkpaRAi0ZDySa8Ih1+oUP4RJHMNpjvgzfAoiGx4A=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RIa9e6014422;
	Mon, 27 Mar 2017 13:36:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 13:36:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RIa949022406;
	Mon, 27 Mar 2017 13:36:09 -0500
Date: Mon, 27 Mar 2017 14:36:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Yury Luneff <yury.lunev@gmail.com>
Message-ID: <20170327183608.GE29187@edge>
References: <698E70FE-FEC5-4D18-A474-E32176B34F91@gmail.com>
	<DC609EBE-9306-49A9-94AB-116C9E60CD1B@gmail.com>
MIME-Version: 1.0
In-Reply-To: <DC609EBE-9306-49A9-94AB-116C9E60CD1B@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Weston not starting up with SGX drivers on BeagleBone Black
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
X-List-Received-Date: Mon, 27 Mar 2017 18:36:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Mar 26, 2017 at 08:41:48PM +0300, Yury Luneff wrote:
> Hello again.
> 
> I seem to resolved this issue. I had to set initial video mode for tilcdc to 
> be 1024x768@60 Hz in uEnv.txt. Then Weston started nicely with —current-mode 
> being 1024x768.

Sounds good. Glad you were able to resolve it! Let us know if you have any 
other issues.

-- 
Denys


> 26 марта 2017 г., в 4:30, Yury Luneff <yury.lunev@gmail.com> написал(а):
> > 
> > Hello!
> > 
> > I’m trying to get Weston running on BeagleBone Black with TI’s SGX drivers. Kernel is 4.9.13-g102f61776e from meta-ti (morty branch) and the drivers alike.
> > I have Weston 1.11 with patches from meta-arago (the patch that forces using card0 whereas I have card0 for tilcdc and card1 for pvrsrvkm plus the Mesa/GBM dealing patch). I had it running with SGX drivers already, but all of a sudden it ceased to startup properly.
> > 
> > # weston --tty=1 -B drm-backend.so --current-mode
> > …
> > [16:07:05.845] Output HDMI-A-1, (connector 26, crtc 24)
> >               mode 1360x768@60.4, preferred, current
> > ...
> > [16:07:05.957] set mode failed: Invalid argument
> > 
> > I’ve posted complete Weston startup log here: http://pastebin.com/bHbdDMas
> > 
> > The failure reason is listed in dmesg log:
> > tilcdc 4830e000.lcdc: Invalid pitch: fb and crtc widths must be the same
> > 
> > I see the patch comments in https://patchwork.kernel.org/patch/7856821/ that introduced this sanity check for tilcdc, but I’m not sure how to achieve proper setup with my case.
> > 
> > I have put 'gbm-format=rgb565’ in /etc/weston.ini. tilcdc’s pixel format seems to be the same: /sys/bus/platform/drivers/tilcdc/4830e000.lcdc/graphics/fb0/bits_per_pixel equals to 16.
> > 
> > I’m not sure how tilcdc and pvrsrvkm should work between each other but the result is weston/wayland not starting because of some framebuffer mode conflict.
> > 
> > I had it working very little time ago and I did it by specifying --current-mode for Weston, but now this option doesn’t help as Weston tries to set_mode anyway.
> > 
> > Please, give me an advice on how to debug this.
> > 
> > Thanks!
> > —
> > Yury Lunev
> > 
> > 
> 
> —
> Yury Lunev
> 

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


