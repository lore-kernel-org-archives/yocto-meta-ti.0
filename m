Return-Path: <tom.rini@gmail.com>
Received: from mail-qw0-f41.google.com (mail-qw0-f41.google.com
	[209.85.216.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0DF7E00744
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 14:32:27 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by qabg40 with SMTP id g40so5812185qab.14
	for <meta-ti@yoctoproject.org>; Tue, 27 Dec 2011 14:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=S3g2TWwithBZTVOcmq6fSepz+N++efVGg1N29tjoOQ0=;
	b=UH30Zp8bw4EvvHwOZWA2iE5unH7v6EyeSSexMtp/b9DoSpsOzA/616cOuEjBRobz5P
	z8TmOwhSh84Efxe+Bfsa/1Z4k2lBWv0yPoaDSEsc+9XHx/18YUI5rIdt7XSel6hNwGWN
	tTc/gWMB9H5ptqPbHjpe/i5zgRyqHDqBn2SZs=
MIME-Version: 1.0
Received: by 10.224.95.196 with SMTP id e4mr28107400qan.18.1325025146119; Tue,
	27 Dec 2011 14:32:26 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Tue, 27 Dec 2011 14:32:26 -0800 (PST)
In-Reply-To: <1325013184-25813-1-git-send-email-bigotp@acm.org>
References: <1325013184-25813-1-git-send-email-bigotp@acm.org>
Date: Tue, 27 Dec 2011 15:32:26 -0700
Message-ID: <CA+M6bXn4OJPD=xJCo1-WDTJ5DxXN68644Qop4vjanq_M2tf83w@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: "Peter A. Bigot" <bigotp@acm.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot 2011.12rc1: OMAP MMC: Add delay before waiting for status
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
X-List-Received-Date: Tue, 27 Dec 2011 22:32:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 27, 2011 at 12:13 PM, Peter A. Bigot <bigotp@acm.org> wrote:
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> Pending upstream patch from http://patchwork.ozlabs.org/patch/132795/ is
> required to successfully boot on xM.
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>

I don't see the harm here so:

Acked-by: Tom Rini <tom.rini@gmail.com>

But I need to talk with Andreas a bit and see what's going on here as
I hadn't seen that problem here before.

-- 
Tom

