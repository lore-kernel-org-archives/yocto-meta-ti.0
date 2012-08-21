Return-Path: <raj.khem@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CAB8E0044A
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 11:39:38 -0700 (PDT)
Received: by eabd1 with SMTP id d1so48435eab.35
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 11:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rdXt+pAEEcXFVa8iolNgFexp8omSROrAL0emLFqIL0o=;
	b=OicZxEUZr30OddPwB9tpZBnRB/pgILV9HquLIQdgHWUf/CSHng19EEMhSKQT7qJuHB
	oDSvY6dWi6p8YZ2yCXKqivABebjV69yRGa5VLMg/IlScSFGgwkh2NWXAiW0X1ro5vyPZ
	x04IUc/71iKGEUsKXoYfQkSg5IRiYfstWGX37xI9JwoK8Y49YKsguUbAwiL3S7AZbEOy
	Vmb1tCZ6f+u/69lwXSj15XdmfW7qEo1eMkGMcz724bT7xDuAA/iq3rhYmS8rDLoPccCV
	3AWoPLbimAPowHTzdSc3HRAjUhrgvHCuYy649cZe/FAe+dBc7M1hzQl+Qb77xr7MpLwp
	ihMQ==
Received: by 10.14.218.134 with SMTP id k6mr14885321eep.14.1345574377443; Tue,
	21 Aug 2012 11:39:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 11:39:07 -0700 (PDT)
In-Reply-To: <20120821180942.GB7636@edge>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
	<20120821180942.GB7636@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 11:39:07 -0700
Message-ID: <CAMKF1sqpM+wVj_EGAqojAUbknH_WnBb4L9nZh3-fH2uDhEx4RA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 21 Aug 2012 18:39:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 11:09 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>
> BTW, Yocto Project prefers self-built toolchain, although you can easily add
> Linaro toolchain with meta-linaro layer.

There are no ABI differences even though its built separately.

