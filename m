Return-Path: <kbaker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B53DE9271C
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 17:41:11 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.21969.1696527668343445875
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 10:41:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfKac2DT;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: kbaker@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso12061505e9.3
        for <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696527667; x=1697132467; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XDligQG4QDG753dSvI6ytfGaYYcyeRLIKkjxc2yfAFg=;
        b=mfKac2DT8MPDf+veEq1ges8nQ/v+gl4bClEcdA7+h5yQuPuiOATCQiGtvtuMPSeyeP
         xCLONFga30KgWfJub+qa9A+BRrYgwTmU1cBsoh2kM7c7wlTIKFzewjBMHxoAR1zyTW+D
         iKdCVvC4IwiPkeOofrDpvZKTPuF7S6hTGHsRz7g7KtH0+LEfY3NSE/mAMB8LsAQPACiA
         J0u7rPO9lng4vVU5OVOx3BcKqp8sLviWX1wgxGfhc3htcLsVOUVVvB4MoGVXO/JZ5kDV
         RwFeXJ/CqpBHUdshpE+76OWCjiUpFLuet0dT/T+RpzfQ0TorHIWWmTWhY2bVgUPf/kqe
         fwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527667; x=1697132467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDligQG4QDG753dSvI6ytfGaYYcyeRLIKkjxc2yfAFg=;
        b=uYbyO9DPXxq5CwWGOIjYHTaX20hxNW+wxa2WhjYE2kV5/QuI1UMboqrmXsOM4i+XeY
         tXUX9TfZiAWXJd3ZISUj1B71ci5EKlOFgaeRJxAJ6Nq+uAo/GRnx/UcnbRzDhB3snB89
         8iFPO0xAotUaznvgvVM4e1R49BAYmiCLTHlP7U5rNBQhdOC2YGof0LSP9fwbuG4RJ0B4
         5s2Q6teAiH/XRlQVrdTzRjuJiA/HbiL6I7H2caBo9spH+R1L5jFWx2jlQUBc0ufevZ0b
         4iO3KXwxVt0B+gBqkFmJcXX45sb46q830wEv8aAQzpnSwJr6z014SF/zO7aLznL1aiF/
         /qQQ==
X-Gm-Message-State: AOJu0Yx590s7k/H7Pl40n8cj58NzmtZBv2wETwRaBXyPUZFhOuhV5uYz
	chW3QHMF+W6IrhrTwkOtywTvX4xiW5k8nGUUCkg=
X-Google-Smtp-Source: AGHT+IErigUjVGUgIbXp6XWO0DXE1ol/jiKMYtI+mDuLr3E9dnsRT4gxSBZ911hVB6ZlLvgU1pFYa2il0sV8ZbaOl98=
X-Received: by 2002:a5d:4d12:0:b0:316:efb9:101d with SMTP id
 z18-20020a5d4d12000000b00316efb9101dmr5462721wrt.25.1696527666376; Thu, 05
 Oct 2023 10:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <AM9PR01MB841284A902CEE0B9B199666F97C4A@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
 <20231003133952.GB26382@denix.org> <AM9PR01MB8412B2FB6744978623CA47D197CBA@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
In-Reply-To: <AM9PR01MB8412B2FB6744978623CA47D197CBA@AM9PR01MB8412.eurprd01.prod.exchangelabs.com>
From: Kevin Baker <kbaker@gmail.com>
Date: Thu, 5 Oct 2023 12:40:48 -0500
Message-ID: <CA+NaiT8g3W1Pp=C6ov51EfiQ_xNC2RZGpRMwW6rANSodn978FA@mail.gmail.com>
Subject: Re: [meta-ti] Unable to mirror meta-ti due to branch-name HEAD
 forbidden in git since Nov 2019
To: "Boettger, Heiko" <heiko.boettger@karlstorz.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000e7f8590606fba082"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Oct 2023 17:41:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17061

--000000000000e7f8590606fba082
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

There does seem to be a branch confusingly named 'HEAD' in the official
repo on git.yoctoproject.org. It is not like this in other repos hosted on
git.yoctoproject.org, as far as I can tell, or in the arago-project repo on
git.ti.com. Could it be from some sort of CI/CD that has added it? Or is
meta-ti actually using it for something?

A branch named HEAD is listed here:

https://git.yoctoproject.org/meta-ti/refs/

Which does not exist here:

https://git.ti.com/cgit/arago-project/meta-ti/refs/

Thanks,
Kevin

On Wed, Oct 4, 2023 at 6:31=E2=80=AFAM Boettger, Heiko <heiko.boettger@karl=
storz.com>
wrote:

> I don't get what you want to say about the repository being old, we are c=
loning
> from git://git.yoctoproject.org/meta-ti.
>
>
>
> ------------------------------
> *Von:* meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> im
> Auftrag von Denys Dmytriyenko <denis@denix.org>
> *Gesendet:* Dienstag, 3. Oktober 2023 15:39
> *An:* Boettger, Heiko <Heiko.Boettger@karlstorz.com>
> *Cc:* meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org>
> *Betreff:* [Ext] Re: [meta-ti] Unable to mirror meta-ti due to
> branch-name HEAD forbidden in git since Nov 2019
>
> On Tue, Oct 03, 2023 at 09:23:13AM +0000, Boettger, Heiko wrote:
> > Hi,
> >
> > there was a recent change in git that doesn't allow to use `HEAD` as a
> > branch name . Is it possible to remove the branch? The ref HEAD should
> still
> > be there. No other repository seems to have such a branch and we
> currently
> > face issues mirroring the meta-ti repository where GitLab refuses to
> accept
> > `HEAD` as a valid branch name.
> >
> > See also
> >
> https://urldefense.com/v3/__https://docs.gitlab.com/ee/user/project/repos=
itory/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1uGqvHvtJ_psGG2E=
t-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0=
syNzTxUcVVfniHAMYrb$
>
> > where GitLab states that this change was introduced in git 2.16.0
> (around 4
> > years ago).
>
> meta-ti already has many official public and non-public mirrors - from
>
> https://urldefense.com/v3/__http://git.yoctoproject.org__;!!Lw1uGqvHvtJ_p=
sGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TU=
N4WQ0syNzTxUcVVfnp3ytjCP$
> , to
> https://urldefense.com/v3/__http://git.ti.com__;!!Lw1uGqvHvtJ_psGG2Et-1vo=
Swbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0syNzT=
xUcVVfnkZYHCwN$
> , to internal bitbucket, etc.
>
> What you are doing is a local clone or even a fork, even if you are using
> it as a local mirror for your project. I would refrain from calling it a
> mirror in public due to possible confusion.
>
> The existing official mirrors are all push based and are always
> up-to-date.
> Where your copy is pull based and depends on how often and for how long
> you are going to update it.
>
> This has happened in the past, where people would make claims in public
> that meta-ti is dead and no longer maintained, as it hasn't been updated
> in years, linking to some obscure fork on github or gitlab that they came
> across somehow...
>
> --
> Denys
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17050):
> https://lists.yoctoproject.org/g/meta-ti/message/17050
> Mute This Topic: https://lists.yoctoproject.org/mt/101730551/3619781
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [
> kbaker+mail@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e7f8590606fba082
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Denys,</div><div><br></div><div>There does seem to=
 be a branch confusingly named &#39;HEAD&#39; in the official repo on <a hr=
ef=3D"http://git.yoctoproject.org">git.yoctoproject.org</a>. It is not like=
 this in other repos hosted on <a href=3D"http://git.yoctoproject.org">git.=
yoctoproject.org</a>, as far as I can tell, or in the arago-project repo on=
 <a href=3D"http://git.ti.com">git.ti.com</a>. Could it be from some sort o=
f CI/CD that has added it? Or is meta-ti actually using it for something?<b=
r></div><div><br></div><div>A branch named HEAD is listed here:<br></div><d=
iv><br></div><div><a href=3D"https://git.yoctoproject.org/meta-ti/refs/">ht=
tps://git.yoctoproject.org/meta-ti/refs/</a></div><div><br></div><div>Which=
 does not exist here:</div><div><br></div><div><a href=3D"https://git.ti.co=
m/cgit/arago-project/meta-ti/refs/">https://git.ti.com/cgit/arago-project/m=
eta-ti/refs/</a></div><div><br></div><div>Thanks,<br></div><div>Kevin<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Oct 4, 2023 at 6:31=E2=80=AFAM Boettger, Heiko &lt;<a href=3D"m=
ailto:heiko.boettger@karlstorz.com">heiko.boettger@karlstorz.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg8879021204976663469">




<div dir=3D"ltr">
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">I don&#39;t get =
what you want to say about the repository being old, we are=C2=A0</span><sp=
an style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Calibr=
i,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">cloning
 from=C2=A0</span><span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos=
_MSFontService,Calibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)=
">git://<a href=3D"http://git.yoctoproject.org/meta-ti" target=3D"_blank">g=
it.yoctoproject.org/meta-ti</a>.</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<span style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cal=
ibri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br>
</span></div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_8879021204976663469appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_8879021204976663469divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> <=
a href=3D"mailto:meta-ti@lists.yoctoproject.org" target=3D"_blank">meta-ti@=
lists.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-ti@lists.yoctoproject=
.org" target=3D"_blank">meta-ti@lists.yoctoproject.org</a>&gt; im Auftrag v=
on Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.org" target=3D"_blan=
k">denis@denix.org</a>&gt;<br>
<b>Gesendet:</b> Dienstag, 3. Oktober 2023 15:39<br>
<b>An:</b> Boettger, Heiko &lt;<a href=3D"mailto:Heiko.Boettger@karlstorz.c=
om" target=3D"_blank">Heiko.Boettger@karlstorz.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:meta-ti@lists.yoctoproject.org" target=3D"_bla=
nk">meta-ti@lists.yoctoproject.org</a> &lt;<a href=3D"mailto:meta-ti@lists.=
yoctoproject.org" target=3D"_blank">meta-ti@lists.yoctoproject.org</a>&gt;<=
br>
<b>Betreff:</b> [Ext] Re: [meta-ti] Unable to mirror meta-ti due to branch-=
name HEAD forbidden in git since Nov 2019</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Tue, Oct 03, 2023 at 09:23:13AM +0000, Boettger, Heiko wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; there was a recent change in git that doesn&#39;t allow to use `HEAD` =
as a <br>
&gt; branch name . Is it possible to remove the branch? The ref HEAD should=
 still <br>
&gt; be there. No other repository seems to have such a branch and we curre=
ntly <br>
&gt; face issues mirroring the meta-ti repository where GitLab refuses to a=
ccept <br>
&gt; `HEAD` as a valid branch name.<br>
&gt; <br>
&gt; See also <br>
&gt; <a href=3D"https://urldefense.com/v3/__https://docs.gitlab.com/ee/user=
/project/repository/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1u=
GqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKt=
q0jDMl4TUN4WQ0syNzTxUcVVfniHAMYrb$" target=3D"_blank">
https://urldefense.com/v3/__https://docs.gitlab.com/ee/user/project/reposit=
ory/branches/*error-ambiguous-head-branch-exists__;Iw!!Lw1uGqvHvtJ_psGG2Et-=
1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0sy=
NzTxUcVVfniHAMYrb$</a>=C2=A0
<br>
&gt; where GitLab states that this change was introduced in git 2.16.0 (aro=
und 4 <br>
&gt; years ago).<br>
<br>
meta-ti already has many official public and non-public mirrors - from <br>
<a href=3D"https://urldefense.com/v3/__http://git.yoctoproject.org__;!!Lw1u=
GqvHvtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKt=
q0jDMl4TUN4WQ0syNzTxUcVVfnp3ytjCP$" target=3D"_blank">https://urldefense.co=
m/v3/__http://git.yoctoproject.org__;!!Lw1uGqvHvtJ_psGG2Et-1voSwbo!cgQTL5gA=
fQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0syNzTxUcVVfnp3ytjC=
P$</a>
 , to <a href=3D"https://urldefense.com/v3/__http://git.ti.com__;!!Lw1uGqvH=
vtJ_psGG2Et-1voSwbo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jD=
Ml4TUN4WQ0syNzTxUcVVfnkZYHCwN$" target=3D"_blank">
https://urldefense.com/v3/__http://git.ti.com__;!!Lw1uGqvHvtJ_psGG2Et-1voSw=
bo!cgQTL5gAfQDW2rjVe-STfnMn7ciE__hTinZmRKZOS0XG_vsvyKtq0jDMl4TUN4WQ0syNzTxU=
cVVfnkZYHCwN$</a> , to internal bitbucket, etc.<br>
<br>
What you are doing is a local clone or even a fork, even if you are using <=
br>
it as a local mirror for your project. I would refrain from calling it a <b=
r>
mirror in public due to possible confusion.<br>
<br>
The existing official mirrors are all push based and are always up-to-date.=
 <br>
Where your copy is pull based and depends on how often and for how long <br=
>
you are going to update it.<br>
<br>
This has happened in the past, where people would make claims in public <br=
>
that meta-ti is dead and no longer maintained, as it hasn&#39;t been update=
d <br>
in years, linking to some obscure fork on github or gitlab that they came <=
br>
across somehow...<br>
<br>
-- <br>
Denys<br>
</div>
</span></font></div>
</div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#17050): <a href=3D"https://lists.yoctoproject.org/g/met=
a-ti/message/17050" rel=3D"noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-ti/message/17050</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101730551/361=
9781" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101730551/3619781</a><br>
Group Owner: <a href=3D"mailto:meta-ti%2Bowner@lists.yoctoproject.org" targ=
et=3D"_blank">meta-ti+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-ti/unsub" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/meta-ti/=
unsub</a> [<a href=3D"mailto:kbaker%2Bmail@gmail.com" target=3D"_blank">kba=
ker+mail@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</div></blockquote></div>

--000000000000e7f8590606fba082--

