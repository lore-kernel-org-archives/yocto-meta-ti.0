Return-Path: <raj.khem@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BCF34E0044D
	for <meta-ti@yoctoproject.org>; Fri,  6 Apr 2012 10:48:48 -0700 (PDT)
Received: by lbol5 with SMTP id l5so1033712lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 06 Apr 2012 10:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=SSuc+zL8gzM8BOZCq+E9VTCANP8HdWu4vC+vo1TeplE=;
	b=cqgEUUhNxk38Aad6nEWEyZT0/duM2xs3R1rN5VJ3mgvisX1eXQzek+ClBIz9Yo6UEq
	ImHYZhR+kc8a4s78XISxgI57MAfsBJ2xBnkMaFdfDWkfl0jGm0skiVx9jr7dnUGw3tNc
	3U2Dhs/jGqwjPp5cPkiD9qp3ZcfqElPOaVKEzsL3RC84Y1Ooog+KvQFMp3zZbLw6nMdM
	GBfZQ5qzWVti5hZRtfjRe97kO9gG11J57fpHXdElrBCtV6GoXJ5EGAFwkdLRxGLRKADp
	CRBHpkc0VwRPFcpcvms3GRVQMMNoIiPNdSnjOzeS798q3pn6c51yEadv6nEkyC7jc2yA
	gJjw==
Received: by 10.152.113.229 with SMTP id jb5mr9683561lab.45.1333734527595;
	Fri, 06 Apr 2012 10:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 6 Apr 2012 10:48:17 -0700 (PDT)
In-Reply-To: <86zkapljsw.fsf@coulee.tdb.com>
References: <86pqbmm4oe.fsf@coulee.tdb.com> <20120405191501.GB5144@denix.org>
	<86bon5nc3h.fsf@coulee.tdb.com> <86zkapljsw.fsf@coulee.tdb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Apr 2012 10:48:17 -0700
Message-ID: <CAMKF1sriMReAWU6ADb1yFMrNcfQYXUL36vmcMPJ2EgpYseS3qQ@mail.gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [Angstrom-devel] building meta-ti + poky HOWTO?
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
X-List-Received-Date: Fri, 06 Apr 2012 17:48:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 5, 2012 at 6:40 PM, Russell Senior
<russell@personaltelco.net> wrote:
>
> This looks like the same problem as here:
>
> =C2=A0http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2012-Mar=
ch/005762.html
>
> That was a month ago. =C2=A0Why hasn't this been fixed? =C2=A0I'm running=
 a stock/very-recent checkout.

Do you know the reason for the failure? if anybody was bothered enough
then someone would have debugged it and sent a patch or atleast
described the problem in more detail.

