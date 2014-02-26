Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2C2BE0091B
	for <meta-ti@yoctoproject.org>; Wed, 26 Feb 2014 09:56:34 -0800 (PST)
Received: by mail-qa0-f48.google.com with SMTP id o15so2753394qap.7
	for <meta-ti@yoctoproject.org>; Wed, 26 Feb 2014 09:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Hn1LGzCK+MM/cgNLhlmOmKItQQaohAFpFpN/OQk4OGU=;
	b=ofEVyTdgYb5+HdTx330ZG1KwQgNn8fSnr49ixoABGgItIxmzo/+kzA++JrcvBx4UZC
	f2t7+BknRFQ3qa+xXX+cmUkFxA+YL/uGeznCcCZqhz/kMY6RtgcXciUe+cwEfwXDAoia
	EX4hDjWmnJKOlCwAqYQhDgWt6Gx9tp2SzANhLX4EA9+wJriB2V15Dx2lbZA0KrLzw3zc
	vs/d+XeCIF/PS09BsQ9/gV18k0zTUT3Ys5QF5CkahXSfy6E8Nvlydjx0y2fYLL/7icmG
	hN/ydZkxKEfJIixuJKvZyi21MRK/EEPKJzPv6f6zVGDzv4L5CriQA9ls6NTbzViFJqr+
	J7PA==
X-Received: by 10.140.21.201 with SMTP id 67mr1131184qgl.78.1393437393513;
	Wed, 26 Feb 2014 09:56:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 26 Feb 2014 09:56:13 -0800 (PST)
In-Reply-To: <20140226164733.GK22125@edge>
References: <CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
	<CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
	<20140211164725.GN3131@edge>
	<CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
	<20140212162334.GE4346@edge>
	<CAMCfZKGFg-CVDmX-O0YK+7pTEo67Yrzd8-uZpLN2y0p7aFy2ZA@mail.gmail.com>
	<CAMCfZKEFq5j=DLsQ6Xx3nhtujFrQtidXHZ3WtcZcNvoANoZSVw@mail.gmail.com>
	<20140226164733.GK22125@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 14:56:13 -0300
Message-ID: <CAMCfZKEPouqu7oA9v2tqRuneXt60fw7Y5+ZqVjhwoXHfNiHrZA@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Feb 2014 17:56:35 -0000
Content-Type: multipart/alternative; boundary=001a11c151f0db74a604f352ecb2

--001a11c151f0db74a604f352ecb2
Content-Type: text/plain; charset=ISO-8859-1

Denys,
On Wed, Feb 26, 2014 at 1:47 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Yes, meta-arago is compatible with dora.
>
Looking at meta-arago git log dora, the support was introduced 8 days ago.
:-)

> But this is not the right mailing
> list to discuss it...
>
Sorry about that.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c151f0db74a604f352ecb2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Denys,<br><div class=3D"gmail_q=
uote">On Wed, Feb 26, 2014 at 1:47 PM, Denys Dmytriyenko <span dir=3D"ltr">=
&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;<=
/span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":10cp" style=3D"overflow:hidden">Yes, meta-arag=
o is compatible with dora. </div>

</blockquote><div>Looking at meta-arago git log dora, the support was intro=
duced 8 days ago. :-)</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">

<div id=3D":10cp" style=3D"overflow:hidden">But this is not the right maili=
ng<br>
list to discuss it...</div></blockquote></div>Sorry about that.<br><br><br =
clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br=
>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http:=
//www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-m=
ail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.em=
barcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c151f0db74a604f352ecb2--
