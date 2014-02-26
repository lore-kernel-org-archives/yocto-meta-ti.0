Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E5A1E0084D
	for <meta-ti@yoctoproject.org>; Wed, 26 Feb 2014 05:37:53 -0800 (PST)
Received: by mail-qc0-f169.google.com with SMTP id e9so1291913qcy.28
	for <meta-ti@yoctoproject.org>; Wed, 26 Feb 2014 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s/j8JZMU3CFwBZXfdQXY9aziIeePji5RL01EYy0nhZ0=;
	b=VH9ETGuV9aT4FIvorSaOulw7gg2N+bOmRXvHhv9KTfZkSwe5S/3y16wzV7vqIGqQv1
	aEsTE16zzn65Fklhvz7QwiAUb8Uqf+/GgdR576ebWoZfM7oho9kT2BBK+K6bpO1LqFEy
	0hlRK3zVeIgOvX1CqHAWaR5C6OEtrevcy1rFsc5EBbJqSvjf785lZiFK1MTEfaH0Gewq
	dPgoyMQ7O5mkDeolWuIZEZd75cYtDkcZaeRLrjkOtnM+oG7JwHwseD6U6BN6o4O9V7Br
	ZXfAY92r9W1KQGwghGY0tZvpxkKD17BA1XjvfXQMCMNHDd4CsC+C1rOdXbnVmAFYBYgn
	pd+w==
X-Received: by 10.229.183.200 with SMTP id ch8mr10107004qcb.17.1393421872414; 
	Wed, 26 Feb 2014 05:37:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 26 Feb 2014 05:37:32 -0800 (PST)
In-Reply-To: <CAMCfZKGFg-CVDmX-O0YK+7pTEo67Yrzd8-uZpLN2y0p7aFy2ZA@mail.gmail.com>
References: <CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
	<CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
	<20140211164725.GN3131@edge>
	<CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
	<20140212162334.GE4346@edge>
	<CAMCfZKGFg-CVDmX-O0YK+7pTEo67Yrzd8-uZpLN2y0p7aFy2ZA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 10:37:32 -0300
Message-ID: <CAMCfZKEFq5j=DLsQ6Xx3nhtujFrQtidXHZ3WtcZcNvoANoZSVw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Wed, 26 Feb 2014 13:37:57 -0000
Content-Type: multipart/alternative; boundary=001a1133916cba456f04f34f4fc6

--001a1133916cba456f04f34f4fc6
Content-Type: text/plain; charset=ISO-8859-1

Denys,
On Thu, Feb 13, 2014 at 4:31 PM, Diego Sueiro <diego.sueiro@gmail.com>wrote:

> I realized that meta-arago is not compatible with dora branch. Is there
> any schedule to get this version supported?

Any info about this?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1133916cba456f04f34f4fc6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Denys,<br><div class=3D"gmail_q=
uote">On Thu, Feb 13, 2014 at 4:31 PM, Diego Sueiro <span dir=3D"ltr">&lt;<=
a href=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gma=
il.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">I realized that meta-arago is not compatible=
 with dora branch. Is there any schedule to get this version supported?</bl=
ockquote>

</div>Any info about this?<br><br><br clear=3D"all"><div><div dir=3D"ltr"><=
div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administr=
ador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1133916cba456f04f34f4fc6--
