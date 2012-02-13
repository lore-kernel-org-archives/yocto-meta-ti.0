Return-Path: <tom.rini@gmail.com>
Received: from mail-pz0-f43.google.com (mail-pz0-f43.google.com
	[209.85.210.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0641E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:51:49 -0800 (PST)
Received: by damc16 with SMTP id c16so5362558dam.2
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BhvR9AakwBl/2Gokzblg6vRdbkMxXQ04lRe1bWNn5IM=;
	b=q2Gt1od1oxbPK123G5e5QTL+p+yPZ2v0l6ISZgXCCARzbyiQdeqXS3Wh9V7U0EOw8y
	g0CRZmCbT1K2W5PBVKdNYK4rmgb2yDSDDSZdVjZb/q3G1D338YU8tl730MaAaueIpzBm
	7u9K2emhN+9HfEXgFXOIfQ4xMpvs9N5N2WOvY=
MIME-Version: 1.0
Received: by 10.68.72.138 with SMTP id d10mr47877087pbv.15.1329159109629; Mon,
	13 Feb 2012 10:51:49 -0800 (PST)
Received: by 10.142.237.1 with HTTP; Mon, 13 Feb 2012 10:51:49 -0800 (PST)
In-Reply-To: <1329156766-29776-7-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
	<1329156766-29776-7-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 13 Feb 2012 11:51:49 -0700
Message-ID: <CA+M6bXnhni9NZN1YOEKZK81HOCbLektXzsoFijY0gmjAtZcWvA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH 7/8] u-boot 2011.09: add patch to support 'cold' AM335x silicon
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
X-List-Received-Date: Mon, 13 Feb 2012 18:51:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 13, 2012 at 11:12 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Tom Rini <trini@ti.com>

-- 
Tom

