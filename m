Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03ECEE01408
	for <meta-ti@yoctoproject.org>; Mon, 24 Jun 2013 13:20:20 -0700 (PDT)
Received: by mail-wg0-f50.google.com with SMTP id k14so8607928wgh.17
	for <meta-ti@yoctoproject.org>; Mon, 24 Jun 2013 13:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Ys/5w4XPtrxn63Pr0qK3bP98Frygsms6WET8ZvTfwXs=;
	b=k6gjOvrdl+EZKVz558+F7UBp8FH8L7jnk65WLVJ8tw0zU8yVrVaSrAA0e4bFXShdnX
	vfv1miY22TBuYTr4g93IqnxMsqDg4PH/pEUy8xr2tHxjsSB3sXAYPmS5ZSeEJBpBY1kU
	dQ4ixyWTQ4/oXYq5t+Xg1j2P++sBO5FNnt/rfu3CBHz+KbjqDtGI6wP+DGppQR35VcWS
	AFoVk8Q5UyfI0jZlAb2sTBopatsGXlxG9bmlzPbmnA+nBcEE64onJBmKOezDn6Zzu+w9
	kEZgM+HB9v2SGu3kM0WPFy9J2HC5Y7GZyQ7tXBcOyBfLRlRmFWErhopXZxL4I+Gp+AIl
	VJ9Q==
X-Received: by 10.180.160.144 with SMTP id xk16mr6938476wib.62.1372105219512; 
	Mon, 24 Jun 2013 13:20:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.83.1 with HTTP; Mon, 24 Jun 2013 13:19:59 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB54497@DBDE04.ent.ti.com>
References: <CAP71WjxuKtkyMbb_pReEXepMKxnNyM9PmwoRc26D+gEL7b87jQ@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB52D53@DBDE04.ent.ti.com>
	<CAP71WjztrzWx6K-MNG4RQfeu0V6F45M0_0j5WP0zZjt9s9i17A@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53158@DBDE04.ent.ti.com>
	<CAP71WjzqEVcxwpwvMc9V-106b2Qyq5uc-x2erf_B7AZXeBQ2Zw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB53242@DBDE04.ent.ti.com>
	<CAP71WjwHYuFPa2ieAh+WbPMnYNt2AC5rx8GP-+7U2Q-RwoOBYQ@mail.gmail.com>
	<20130620045521.GR13356@edge>
	<321768C95D21724485BCE784F1BE98473EB53340@DBDE04.ent.ti.com>
	<CAP71Wjx3cAmqn1=wBAPZFbT7ARw_ha0hx=WDsp9e+QaiJcQagA@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473EB54497@DBDE04.ent.ti.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 24 Jun 2013 22:19:59 +0200
Message-ID: <CAP71Wjz37WvoWzGGOkqYZiyDwbgqC=UhJHaDVvXnDdKHN1Rd7Q@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
X-Gm-Message-State: ALoCoQmztvTw/QIfB7736f+fvK+aiQOYOBazSkQdxGcFjm/JY2fFPF9YQ/M3k6hAF5D/AYLH8Tdk
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti + meta-qt5
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
X-List-Received-Date: Mon, 24 Jun 2013 20:20:22 -0000
Content-Type: multipart/alternative; boundary=047d7b62495434258d04dfec24d1

--047d7b62495434258d04dfec24d1
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 21, 2013 at 9:49 AM, Sundareson, Prabindh <prabu@ti.com> wrote:

> So, is Mesa providing libegl in your case ?****
>
>
yes. but that was 'just' for sanity testing the build.

have you tested Qt5 + eglfs + EGL? Who provides the EGL in that case, is
that something you created/modified, or is it coming straight from IMG?

--047d7b62495434258d04dfec24d1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Jun 21, 2013 at 9:49 AM, Sundareson, Prabindh <span dir=3D"ltr">&lt=
;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&gt;</sp=
an> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><p class=3D"MsoNormal"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f=
497d">So, is Mesa providing libegl in your case ?<u></u><u></u></span></p>


<p class=3D"MsoNormal"></p></blockquote></div><br>yes. but that was &#39;ju=
st&#39; for sanity testing the build.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra" style>have you tested Qt5 + eglfs + EGL? Wh=
o provides the EGL in that case, is that something you created/modified, or=
 is it coming straight from IMG?</div>

<div class=3D"gmail_extra" style><br></div><div class=3D"gmail_extra" style=
><br></div></div>

--047d7b62495434258d04dfec24d1--
