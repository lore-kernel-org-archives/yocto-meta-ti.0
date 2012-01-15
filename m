Return-Path: <raj.khem@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE368E0030C
	for <meta-ti@yoctoproject.org>; Sat, 14 Jan 2012 17:30:23 -0800 (PST)
Authentication-Results: yocto-www.yoctoproject.org; dkim=pass
	(1024-bit key; insecure key) header.i=@gmail.com;
	x-dkim-adsp=none (insecure policy)
Received: by lagp5 with SMTP id p5so1346127lag.35
	for <meta-ti@yoctoproject.org>; Sat, 14 Jan 2012 17:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=yV36EFq5uzTn9f9RbGZPxlTdIyUFOaxWzY6FwEgpI84=;
	b=PLR2ZxwYfeIlG6bGu4ZrT/ehfsaNZhcdUTwdlGIQDi+6gc+4XX7ZWgUD3DaU9Udohd
	5MHgikWRj74OsWYgoqS6JHUlrDdRaMYVISlXK4OI6uewxjTFfWMLxTCQcjN3qU0yY0BE
	gplNv56QLYcRSAZgEKGNXhFwpnpL47TLFpkb4=
Received: by 10.112.23.5 with SMTP id i5mr1613611lbf.92.1326591022397; Sat, 14
	Jan 2012 17:30:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Sat, 14 Jan 2012 17:29:51 -0800 (PST)
In-Reply-To: <CA+M6bX=jC_u1U1FJPg2kjMZVavU+2q04Bt2s-6W1qzCBu+DCdw@mail.gmail.com>
References: <1326399305-32405-1-git-send-email-raj.khem@gmail.com>
	<CA+M6bX=jC_u1U1FJPg2kjMZVavU+2q04Bt2s-6W1qzCBu+DCdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Jan 2012 17:29:51 -0800
Message-ID: <CAMKF1spqb5Dwv0w=Xk5vKGtPLgzGuKa+XqrAC_XbeMe03y1B5Q@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V3] u-boot_2011.09, u-boot_2011.12: Always use gnu ld for LD
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
X-List-Received-Date: Sun, 15 Jan 2012 01:30:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 14, 2012 at 1:35 PM, Tom Rini <tom.rini@gmail.com> wrote:
> I suspect Wolfgang would NAK this as he's said before that you should
> use the correct toolchain to build things. =C2=A0So perhaps Inappropriate
> [integration] ?

Although I feel that having a fall back with in u-boot is better
option since you can avoid lot of support so probably no harm in
proposing it. If its not accepted we can always keep it
local.

