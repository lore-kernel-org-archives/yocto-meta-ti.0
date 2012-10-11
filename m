Return-Path: <ndec13@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E124E01457
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:48:08 -0700 (PDT)
Received: by mail-vc0-f176.google.com with SMTP id gb22so2529222vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ztXoLzNS047ExtPRsH7MQtZTHQtc1BM9xLiOmRNghgM=;
	b=LZnC2RXSCxf0QPLaa2KYlCVdomgcBVyKda5gmKy0AWf2PQpeSz6kkMclBbjfloOCSa
	6ytjvSidjEd6OV5o9bxEeBRakV4Nkn8EDbQ37VAGfJ19Dwn84x1GJAT40FwCd522GmKa
	knoWmXePzExpDYzsMRQn2Qb3JoiO1PAX9oJxLNKHZ4Gv36y0eAgYI0zbTpuktF/r7O3q
	gsl4Nkt+FrXtkAcUS+M5Oot15UGzbjLNg/dGTsQhkAxj8x9KhLBKMjubr+sRKJDYII2B
	R2QyRi5L6sZLTiK1k9uBojgwQNKwAz30GeLA2ATzY9tEWnyoCzoHzIf4pkgRHcH0EjOY
	ZqgA==
Received: by 10.52.177.104 with SMTP id cp8mr419673vdc.47.1349963287440; Thu,
	11 Oct 2012 06:48:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.80.71 with HTTP; Thu, 11 Oct 2012 06:47:47 -0700 (PDT)
In-Reply-To: <5076C554.6060200@mlbassoc.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Thu, 11 Oct 2012 15:47:47 +0200
Message-ID: <CAOT3mi+bOHJGrx7Q3ZyB4etQGDkc4H2wbPk+SFN0MxoAPzuG9A@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Thu, 11 Oct 2012 13:48:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 3:10 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Does that include the plugins as well?

if you mean plugin for h/w accelerated codec (IVAHD), aka gst-ducati.
it won't be included in the vanilla gst (though it could be possible,
if we ever get omapdce driver in mainline kernel...), but gst-ducati
will released separately, and will be build against a vanilla gst.
unlike today where we need a large number of patches in gst.

>
> Is there a schedule for this change?

gst-ducati has been ported on gst1.0 already, if that was the question.

>
> BTW, Does anyone know when OE-core or meta-openembedded will have support
> for gstreamer-1.0?

good question, indeed.

