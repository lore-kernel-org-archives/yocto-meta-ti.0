Return-Path: <leonid.iziumtsev@globallogic.com>
Received: from exprod5og105.obsmtp.com (exprod5og105.obsmtp.com [64.18.0.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13AC4E01571
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 01:22:07 -0700 (PDT)
Received: from mail-lb0-f180.google.com ([209.85.217.180]) (using TLSv1) by
	exprod5ob105.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUkFLrn695YeFuZviq4i7MeLG9L+fPwbU@postini.com;
	Tue, 24 Sep 2013 01:22:09 PDT
Received: by mail-lb0-f180.google.com with SMTP id q8so3457027lbi.25
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 01:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=globallogic.com; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e69YDt0O+lf0UbwqJSoMcSKqJ7cLuWtamWhcd+/vRm4=;
	b=a4L1cCZ8qtcQM+mzqN1lrSpMyyDw/IcJi9ZEFKQYcKrNg9i+xrWExS3FBRsSyOsDQZ
	kV+3mPlYKN1KnLZiBXLcCR3ucP8Lsq2fG6uP4Zq7mknbc9N6zswUB8s83zKQbijDs8BY
	lk7Pwz5VpQIGX5kSoB1ZZk34qWNIPhxgxzjak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=e69YDt0O+lf0UbwqJSoMcSKqJ7cLuWtamWhcd+/vRm4=;
	b=agFOTnTF8St3dhXarziPRof4SRUHcJIrpc9jySRuL/2VI1VLoPOjBKUXe9KK7EsA1a
	6cThVOE9nZ/bMVuqRh8vSLHGP0RHzTbwsQoLo38T4HippK0hZgyD6JS0+HBR4RJK+SgW
	N47oEe1LNalP5hv6+IBAq14mkxz0UqZRrMP7sBWu5JiE6sWv01PPrGH/pygeHhF7KyME
	SYocFzNk4Raa/cfJNmUzEA+IvH7yBrawjRvOGnH74sGv4bX1iMD2tv+Gm/nFF8+rc30E
	GZw8A2V9l7Nwn1eDciYPpkP4gwQBB+XpzRwhOM6hPOA6NlaJv5b/R9fhOnGs/AxOX2jv
	b1kA==
X-Gm-Message-State: ALoCoQkAhCwGgrZyFOMs01UtBpn72y8UeuQRygIUch+nBj+RU0ROmH9H9D9beW7tqE5GSCqYRF2xu6bInLv8tRWpCErT/mvFeb6crsKyHTw7uNSm/qlfgRqvfNH6TlbxqFN6FOlMGxmAGmqQUwsGU62bPRLFE7u/wtRmOORJA7XHwarVRFkvaxI=
X-Received: by 10.112.155.39 with SMTP id vt7mr5485812lbb.29.1380010925151;
	Tue, 24 Sep 2013 01:22:05 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.112.155.39 with SMTP id vt7mr5485798lbb.29.1380010924931;
	Tue, 24 Sep 2013 01:22:04 -0700 (PDT)
Received: by 10.114.177.136 with HTTP; Tue, 24 Sep 2013 01:22:04 -0700 (PDT)
In-Reply-To: <CAAtecJHsGT547fjcK6GKVLr7gN5dPpse9y1eo-eqRorzDFh8AQ@mail.gmail.com>
References: <CAAtecJGYGsuMf807WCQ4c4Qt6LaE=39gEMXeKE_Z64eYZv4KXg@mail.gmail.com>
	<CAAtecJHF87AjpXtDQo0U5n_ah28SJF__m1xcqHbvFOLqvOaDcw@mail.gmail.com>
	<20130923132342.GA3456@edge>
	<CAAtecJHsGT547fjcK6GKVLr7gN5dPpse9y1eo-eqRorzDFh8AQ@mail.gmail.com>
Date: Tue, 24 Sep 2013 11:22:04 +0300
Message-ID: <CAAtecJFw7NkVq0EA82mhNwdDYSj5zuMSv_xxfVyZW14yJdvNgQ@mail.gmail.com>
From: Leonid Iziumtsev <leonid.iziumtsev@globallogic.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: omap5: 3d graphics hardware acceleration build
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
X-List-Received-Date: Tue, 24 Sep 2013 08:22:10 -0000
X-Groupsio-MsgNum: 3348
Content-Type: multipart/mixed; boundary=089e0112c136f79af104e71cd4e7

--089e0112c136f79af104e71cd4e7
Content-Type: multipart/alternative; boundary=089e0112c136f79ae804e71cd4e5

--089e0112c136f79ae804e71cd4e5
Content-Type: text/plain; charset=ISO-8859-1

Denys, all,

I also found that TI provide OMAP5 GLSDK and according to this guide -
http://processors.wiki.ti.com/index.php/OMAP5_GLSDK_Software_Developers_Guide
I should be able to build "arago-glsdk-multimedia-image" target that I
believe contain all support for SGX and Ducati *(please correct me if I'm
wrong).
*
Unfortunately I could not find GLSDK6.02. The latest version that is
available here -
http://software-dl.ti.com/dsps/dsps_public_sw/glsdk/latest/index_FDS.htmlis
6.01
*(please give me the link to 6.02 if you know where to get it)*.

I followed procedure (described in GLSDK guide ) using GLSDK6.01 but get
such error:

    *ERROR: Nothing PROVIDES 'arago-glsdk-multimedia-image'*
Looking into "yocto-layers"directory (root folder for git://
arago-project.org/git/projects/oe-layersetup) I couldn't find recipe for
this target. *Can you please suggest what is the problem? Could it be
related to old GLSDK6.01 that I'm using?*

Also "arago-glsdk-multimedia-image" wasn't present in  list of available
targets. That only targets that I got are :

    core-image-minimal
    core-image-sato
    meta-toolchain
    meta-toolchain-sdk
    adt-installer
    meta-ide-support

The output of "oe-layertool-setup.sh" script looks a bit strange to me
(please find full log in attachment).
I complain to such lines:

Fetching arago
fatal: git checkout: updating paths is incompatible with switching branches.
Did you intend to checkout 'origin/danny' which can not be resolved as
commit?
fatal: 'origin/danny' does not point to a commit
Note: checking out 'af9632689392ea03fd14879ca33b3c6c6ed2e347'.

not sure if it is right behaviour.

Thank you again for helping me. Looking forward for you reply!

Regards,
Leonid



On Tue, Sep 24, 2013 at 9:27 AM, Leonid Iziumtsev <
leonid.iziumtsev@globallogic.com> wrote:

> Hi Denys,
>
> Thank you for fast reply and clarification!
>
>
> On Mon, Sep 23, 2013 at 4:23 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>
>> On Mon, Sep 23, 2013 at 01:15:11PM +0300, Leonid Iziumtsev wrote:
>> > Hi all,
>> >
>> > Pardon me if this list is not the right place to ask the questions and
>> if
>> > so, please poing me to the right one.
>> >
>> > I'm developer in Panasonic Inc. Currently working with OAMP5 (pandaboard
>> > uevm) I'm trying to get build with 3D graphics hardware acceleration
>> using
>> > DirectFB (no X support recurred). In future hopefully going run some Qt
>> > based UI.
>> > In search I came across "meta-ti" layer.
>> >
>> > I'm new in yocto based build system so don't
>> > completely understand: is it what I was looking for? Will it allow me to
>> > get build with proper graphic support?
>>
>> Leonid,
>>
>> Yes, this is the correct layer for OMAP5 uEVM support. But 3D Graphics is
>> not
>> yet available - there were some patches being developed, but they haven't
>> been
>> finalized yet.
>>
>> --
>> Denys
>>
>
>
>
> --
>
> Name | Title
> GlobalLogic
> P +x.xxx.xxx.xxxx  M +x.xxx.xxx.xxxx  S skype
> www.globallogic.com
>  <http://www.globallogic.com/>
> http://www.globallogic.com/email_disclaimer.txt
>



-- 

Name | Title
GlobalLogic
P +x.xxx.xxx.xxxx  M +x.xxx.xxx.xxxx  S skype
www.globallogic.com
<http://www.globallogic.com/>
http://www.globallogic.com/email_disclaimer.txt

--089e0112c136f79ae804e71cd4e5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Denys, all,<br><br></div>I also f=
ound that TI provide OMAP5 GLSDK and according to this guide - <a href=3D"h=
ttp://processors.wiki.ti.com/index.php/OMAP5_GLSDK_Software_Developers_Guid=
e">http://processors.wiki.ti.com/index.php/OMAP5_GLSDK_Software_Developers_=
Guide</a><br>
</div>I should be able to build &quot;arago-glsdk-multimedia-image&quot; ta=
rget that I believe contain all support for SGX and Ducati <u>(please corre=
ct me if I&#39;m wrong).<b><br></b></u><br></div>Unfortunately I could not =
find GLSDK6.02. The latest version that is available here - <a href=3D"http=
://software-dl.ti.com/dsps/dsps_public_sw/glsdk/latest/index_FDS.html">http=
://software-dl.ti.com/dsps/dsps_public_sw/glsdk/latest/index_FDS.html</a> i=
s 6.01 <u>(please give me the link to 6.02 if you know where to get it)</u>=
.<br>
=A0<br></div>I followed procedure (described in GLSDK guide ) using GLSDK6.=
01 but get such error:<br><br>=A0=A0=A0 <b>ERROR: Nothing PROVIDES &#39;ara=
go-glsdk-multimedia-image&#39;</b><br></div>Looking into &quot;yocto-layers=
&quot;directory (root folder for git://<a href=3D"http://arago-project.org/=
git/projects/oe-layersetup">arago-project.org/git/projects/oe-layersetup</a=
>) I couldn&#39;t find recipe for this target. <u>Can you please suggest wh=
at is the problem? Could it be related to old GLSDK6.01 that I&#39;m using?=
</u><br>
<br>Also &quot;arago-glsdk-multimedia-image&quot; wasn&#39;t present in=A0 =
list of available targets. That only targets that I got are :<br><br>=A0=A0=
=A0 core-image-minimal<br>=A0=A0=A0 core-image-sato<br>=A0=A0=A0 meta-toolc=
hain<br>=A0=A0=A0 meta-toolchain-sdk<br>
=A0=A0=A0 adt-installer<br>=A0=A0=A0 meta-ide-support<br><br><div>The outpu=
t of &quot;oe-layertool-setup.sh&quot; script looks a bit strange to me (pl=
ease find full log in attachment).<br></div><div>I complain to such lines:<=
br><br>Fetching arago<br>
fatal: git checkout: updating paths is incompatible with switching branches=
.<br>Did you intend to checkout &#39;origin/danny&#39; which can not be res=
olved as commit?<br>fatal: &#39;origin/danny&#39; does not point to a commi=
t<br>
Note: checking out &#39;af9632689392ea03fd14879ca33b3c6c6ed2e347&#39;.<br><=
br></div><div>not sure if it is right behaviour.<br><br></div><div>Thank yo=
u again for helping me. Looking forward for you reply!<br><br></div><div>
Regards,<br>Leonid<br></div><div><br></div></div><div class=3D"gmail_extra"=
><br><br><div class=3D"gmail_quote">On Tue, Sep 24, 2013 at 9:27 AM, Leonid=
 Iziumtsev <span dir=3D"ltr">&lt;<a href=3D"mailto:leonid.iziumtsev@globall=
ogic.com" target=3D"_blank">leonid.iziumtsev@globallogic.com</a>&gt;</span>=
 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi Denys,<br><br></div=
>Thank you for fast reply and clarification!<br></div><div class=3D"gmail_e=
xtra">
<div><div class=3D"h5"><br><br><div class=3D"gmail_quote">On Mon, Sep 23, 2=
013 at 4:23 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
enys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On Mon, Sep 23, 2013 at 01:15:11PM=
 +0300, Leonid Iziumtsev wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; Pardon me if this list is not the right place to ask the questions and=
 if<br>
&gt; so, please poing me to the right one.<br>
&gt;<br>
&gt; I&#39;m developer in Panasonic Inc. Currently working with OAMP5 (pand=
aboard<br>
&gt; uevm) I&#39;m trying to get build with 3D graphics hardware accelerati=
on using<br>
&gt; DirectFB (no X support recurred). In future hopefully going run some Q=
t<br>
&gt; based UI.<br>
&gt; In search I came across &quot;meta-ti&quot; layer.<br>
&gt;<br>
&gt; I&#39;m new in yocto based build system so don&#39;t<br>
&gt; completely understand: is it what I was looking for? Will it allow me =
to<br>
&gt; get build with proper graphic support?<br>
<br>
</div></div>Leonid,<br>
<br>
Yes, this is the correct layer for OMAP5 uEVM support. But 3D Graphics is n=
ot<br>
yet available - there were some patches being developed, but they haven&#39=
;t been<br>
finalized yet.<br>
<span><font color=3D"#888888"><br>
--<br>
Denys<br>
</font></span></blockquote></div><br><br clear=3D"all"><br></div></div><spa=
n class=3D"HOEnZb"><font color=3D"#888888">-- <br><font size=3D"-1"><br><sp=
an style=3D"vertical-align:baseline;font-variant:normal;font-style:normal;f=
ont-size:12px;background-color:transparent;text-decoration:none;font-family=
:Arial;font-weight:bold">Name | Title</span><br>

<span style=3D"vertical-align:baseline;font-variant:normal;font-style:norma=
l;font-size:12px;background-color:transparent;text-decoration:none;font-fam=
ily:Arial;font-weight:normal">GlobalLogic</span><br><span style=3D"vertical=
-align:baseline;font-variant:normal;font-style:normal;font-size:12px;backgr=
ound-color:transparent;text-decoration:none;font-family:Arial;font-weight:n=
ormal">P +x.xxx.xxx.xxxx=A0=A0M +x.xxx.xxx.xxxx=A0=A0S=A0skype</span><br>

<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline">www.globallogic.com</span></a><span style=
=3D"vertical-align:baseline;font-variant:normal;font-style:normal;font-size=
:12px;background-color:transparent;text-decoration:none;font-family:Arial;f=
ont-weight:normal"></span><br>

<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline"></span></a><br>

<a href=3D"http://www.globallogic.com/email_disclaimer.txt" target=3D"_blan=
k"><span style=3D"font-size:11px;font-family:Arial;color:#1155cc;background=
-color:transparent;font-weight:normal;font-style:normal;font-variant:normal=
;text-decoration:underline;vertical-align:baseline">http://www.globallogic.=
com/email_disclaimer.txt</span></a><span style=3D"vertical-align:baseline;f=
ont-variant:normal;font-style:normal;font-size:11px;background-color:transp=
arent;text-decoration:none;font-family:Arial;font-weight:normal"></span></f=
ont>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><font size=3D"-1"><br><=
span style=3D"vertical-align:baseline;font-variant:normal;font-style:normal=
;font-size:12px;background-color:transparent;text-decoration:none;font-fami=
ly:Arial;font-weight:bold">Name | Title</span><br>
<span style=3D"vertical-align:baseline;font-variant:normal;font-style:norma=
l;font-size:12px;background-color:transparent;text-decoration:none;font-fam=
ily:Arial;font-weight:normal">GlobalLogic</span><br><span style=3D"vertical=
-align:baseline;font-variant:normal;font-style:normal;font-size:12px;backgr=
ound-color:transparent;text-decoration:none;font-family:Arial;font-weight:n=
ormal">P +x.xxx.xxx.xxxx=A0=A0M +x.xxx.xxx.xxxx=A0=A0S=A0skype</span><br>
<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline">www.globallogic.com</span></a><span style=
=3D"vertical-align:baseline;font-variant:normal;font-style:normal;font-size=
:12px;background-color:transparent;text-decoration:none;font-family:Arial;f=
ont-weight:normal"></span><br>
<a href=3D"http://www.globallogic.com/" target=3D"_blank"><span style=3D"fo=
nt-size:12px;font-family:Arial;color:#1155cc;background-color:transparent;f=
ont-weight:normal;font-style:normal;font-variant:normal;text-decoration:und=
erline;vertical-align:baseline"></span></a><br>
<a href=3D"http://www.globallogic.com/email_disclaimer.txt" target=3D"_blan=
k"><span style=3D"font-size:11px;font-family:Arial;color:#1155cc;background=
-color:transparent;font-weight:normal;font-style:normal;font-variant:normal=
;text-decoration:underline;vertical-align:baseline">http://www.globallogic.=
com/email_disclaimer.txt</span></a><span style=3D"vertical-align:baseline;f=
ont-variant:normal;font-style:normal;font-size:11px;background-color:transp=
arent;text-decoration:none;font-family:Arial;font-weight:normal"></span></f=
ont>
</div>

--089e0112c136f79ae804e71cd4e5--

--089e0112c136f79af104e71cd4e7
Content-Type: application/octet-stream; name="oe-layertool-setup.output"
Content-Disposition: attachment; filename="oe-layertool-setup.output"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hlytmwvz0

bGl6aXVtdHNldkBrYnAxLWRocC1mMjQyMjI6fi90aS1nbHNka19vbWFwNS11ZXZtXzZfMDFfMDBf
MDEveW9jdG8tbGF5ZXJzJCAuL29lLWxheWVydG9vbC1zZXR1cC5zaCAtZiBjb25maWdzL2dsc2Rr
L2dsc2RrLTA2LjAxLjAwLWNvbmZpZy50eHQKL2hvbWUvbGl6aXVtdHNldi90aS1nbHNka19vbWFw
NS11ZXZtXzZfMDFfMDBfMDEveW9jdG8tbGF5ZXJzCgoKY2xvbmluZyByZXBvIGJpdGJha2UKCkZl
dGNoaW5nIG9lCmZhdGFsOiBnaXQgY2hlY2tvdXQ6IHVwZGF0aW5nIHBhdGhzIGlzIGluY29tcGF0
aWJsZSB3aXRoIHN3aXRjaGluZyBicmFuY2hlcy4KRGlkIHlvdSBpbnRlbmQgdG8gY2hlY2tvdXQg
J29yaWdpbi9tYXN0ZXInIHdoaWNoIGNhbiBub3QgYmUgcmVzb2x2ZWQgYXMgY29tbWl0PwpmYXRh
bDogJ29yaWdpbi9tYXN0ZXInIGRvZXMgbm90IHBvaW50IHRvIGEgY29tbWl0Ck5vdGU6IGNoZWNr
aW5nIG91dCAnMS4xNy4wJy4KCllvdSBhcmUgaW4gJ2RldGFjaGVkIEhFQUQnIHN0YXRlLiBZb3Ug
Y2FuIGxvb2sgYXJvdW5kLCBtYWtlIGV4cGVyaW1lbnRhbApjaGFuZ2VzIGFuZCBjb21taXQgdGhl
bSwgYW5kIHlvdSBjYW4gZGlzY2FyZCBhbnkgY29tbWl0cyB5b3UgbWFrZSBpbiB0aGlzCnN0YXRl
IHdpdGhvdXQgaW1wYWN0aW5nIGFueSBicmFuY2hlcyBieSBwZXJmb3JtaW5nIGFub3RoZXIgY2hl
Y2tvdXQuCgpJZiB5b3Ugd2FudCB0byBjcmVhdGUgYSBuZXcgYnJhbmNoIHRvIHJldGFpbiBjb21t
aXRzIHlvdSBjcmVhdGUsIHlvdSBtYXkKZG8gc28gKG5vdyBvciBsYXRlcikgYnkgdXNpbmcgLWIg
d2l0aCB0aGUgY2hlY2tvdXQgY29tbWFuZCBhZ2Fpbi4gRXhhbXBsZToKCiAgZ2l0IGNoZWNrb3V0
IC1iIG5ld19icmFuY2hfbmFtZQoKSEVBRCBpcyBub3cgYXQgY2M3ZmRiZC4uLiBVcGRhdGUgdmVy
c2lvbiB0byAxLjE3LjAKCgpjbG9uaW5nIHJlcG8gbWV0YS1hcmFnbwoKRmV0Y2hpbmcgYXJhZ28K
ZmF0YWw6IGdpdCBjaGVja291dDogdXBkYXRpbmcgcGF0aHMgaXMgaW5jb21wYXRpYmxlIHdpdGgg
c3dpdGNoaW5nIGJyYW5jaGVzLgpEaWQgeW91IGludGVuZCB0byBjaGVja291dCAnb3JpZ2luL21h
c3Rlcicgd2hpY2ggY2FuIG5vdCBiZSByZXNvbHZlZCBhcyBjb21taXQ/CmZhdGFsOiAnb3JpZ2lu
L21hc3RlcicgZG9lcyBub3QgcG9pbnQgdG8gYSBjb21taXQKTm90ZTogY2hlY2tpbmcgb3V0ICdk
MDhmNDI0YmQwNzhkOWEwYzg4YTk0YWM5MmY4NTljOGVmYWYwNmQ0Jy4KCllvdSBhcmUgaW4gJ2Rl
dGFjaGVkIEhFQUQnIHN0YXRlLiBZb3UgY2FuIGxvb2sgYXJvdW5kLCBtYWtlIGV4cGVyaW1lbnRh
bApjaGFuZ2VzIGFuZCBjb21taXQgdGhlbSwgYW5kIHlvdSBjYW4gZGlzY2FyZCBhbnkgY29tbWl0
cyB5b3UgbWFrZSBpbiB0aGlzCnN0YXRlIHdpdGhvdXQgaW1wYWN0aW5nIGFueSBicmFuY2hlcyBi
eSBwZXJmb3JtaW5nIGFub3RoZXIgY2hlY2tvdXQuCgpJZiB5b3Ugd2FudCB0byBjcmVhdGUgYSBu
ZXcgYnJhbmNoIHRvIHJldGFpbiBjb21taXRzIHlvdSBjcmVhdGUsIHlvdSBtYXkKZG8gc28gKG5v
dyBvciBsYXRlcikgYnkgdXNpbmcgLWIgd2l0aCB0aGUgY2hlY2tvdXQgY29tbWFuZCBhZ2Fpbi4g
RXhhbXBsZToKCiAgZ2l0IGNoZWNrb3V0IC1iIG5ld19icmFuY2hfbmFtZQoKSEVBRCBpcyBub3cg
YXQgZDA4ZjQyNC4uLiBpbWFnZXM6IEFkZCBuZXcgYXJhZ28tZ2xzZGstY29uc29sZS1pbWFnZQoK
CmNsb25pbmcgcmVwbyBtZXRhLW9wZW5lbWJlZGRlZAoKRmV0Y2hpbmcgb2UKZmF0YWw6IGdpdCBj
aGVja291dDogdXBkYXRpbmcgcGF0aHMgaXMgaW5jb21wYXRpYmxlIHdpdGggc3dpdGNoaW5nIGJy
YW5jaGVzLgpEaWQgeW91IGludGVuZCB0byBjaGVja291dCAnb3JpZ2luL2Rhbm55JyB3aGljaCBj
YW4gbm90IGJlIHJlc29sdmVkIGFzIGNvbW1pdD8KZmF0YWw6ICdvcmlnaW4vZGFubnknIGRvZXMg
bm90IHBvaW50IHRvIGEgY29tbWl0Ck5vdGU6IGNoZWNraW5nIG91dCAnZjAwMDI4Y2FmMjU3ZTM4
NmMwZjNhZTQ2YmQ0YjNiYTUzZGQwNzI5ZCcuCgpZb3UgYXJlIGluICdkZXRhY2hlZCBIRUFEJyBz
dGF0ZS4gWW91IGNhbiBsb29rIGFyb3VuZCwgbWFrZSBleHBlcmltZW50YWwKY2hhbmdlcyBhbmQg
Y29tbWl0IHRoZW0sIGFuZCB5b3UgY2FuIGRpc2NhcmQgYW55IGNvbW1pdHMgeW91IG1ha2UgaW4g
dGhpcwpzdGF0ZSB3aXRob3V0IGltcGFjdGluZyBhbnkgYnJhbmNoZXMgYnkgcGVyZm9ybWluZyBh
bm90aGVyIGNoZWNrb3V0LgoKSWYgeW91IHdhbnQgdG8gY3JlYXRlIGEgbmV3IGJyYW5jaCB0byBy
ZXRhaW4gY29tbWl0cyB5b3UgY3JlYXRlLCB5b3UgbWF5CmRvIHNvIChub3cgb3IgbGF0ZXIpIGJ5
IHVzaW5nIC1iIHdpdGggdGhlIGNoZWNrb3V0IGNvbW1hbmQgYWdhaW4uIEV4YW1wbGU6CgogIGdp
dCBjaGVja291dCAtYiBuZXdfYnJhbmNoX25hbWUKCkhFQUQgaXMgbm93IGF0IGYwMDAyOGMuLi4g
Y2lmcy11dGlsczogQWRkIHJ1bnRpbWUgcmVjb21tZW5kYXRpb24gdG8gQ0lGUyBrZXJuZWwgbW9k
dWxlCgoKY2xvbmluZyByZXBvIG1ldGEtdGkKCkZldGNoaW5nIGFyYWdvCmZhdGFsOiBnaXQgY2hl
Y2tvdXQ6IHVwZGF0aW5nIHBhdGhzIGlzIGluY29tcGF0aWJsZSB3aXRoIHN3aXRjaGluZyBicmFu
Y2hlcy4KRGlkIHlvdSBpbnRlbmQgdG8gY2hlY2tvdXQgJ29yaWdpbi9kYW5ueScgd2hpY2ggY2Fu
IG5vdCBiZSByZXNvbHZlZCBhcyBjb21taXQ/CmZhdGFsOiAnb3JpZ2luL2Rhbm55JyBkb2VzIG5v
dCBwb2ludCB0byBhIGNvbW1pdApOb3RlOiBjaGVja2luZyBvdXQgJ2FmOTYzMjY4OTM5MmVhMDNm
ZDE0ODc5Y2EzM2IzYzZjNmVkMmUzNDcnLgoKWW91IGFyZSBpbiAnZGV0YWNoZWQgSEVBRCcgc3Rh
dGUuIFlvdSBjYW4gbG9vayBhcm91bmQsIG1ha2UgZXhwZXJpbWVudGFsCmNoYW5nZXMgYW5kIGNv
bW1pdCB0aGVtLCBhbmQgeW91IGNhbiBkaXNjYXJkIGFueSBjb21taXRzIHlvdSBtYWtlIGluIHRo
aXMKc3RhdGUgd2l0aG91dCBpbXBhY3RpbmcgYW55IGJyYW5jaGVzIGJ5IHBlcmZvcm1pbmcgYW5v
dGhlciBjaGVja291dC4KCklmIHlvdSB3YW50IHRvIGNyZWF0ZSBhIG5ldyBicmFuY2ggdG8gcmV0
YWluIGNvbW1pdHMgeW91IGNyZWF0ZSwgeW91IG1heQpkbyBzbyAobm93IG9yIGxhdGVyKSBieSB1
c2luZyAtYiB3aXRoIHRoZSBjaGVja291dCBjb21tYW5kIGFnYWluLiBFeGFtcGxlOgoKICBnaXQg
Y2hlY2tvdXQgLWIgbmV3X2JyYW5jaF9uYW1lCgpIRUFEIGlzIG5vdyBhdCBhZjk2MzI2Li4uIGFi
ZWZ3OiBGaXJtd2FyZSBmb3IgT01BUDUgQUJFCgoKY2xvbmluZyByZXBvIG1ldGEtbGluYXJvCgpG
ZXRjaGluZyBsaW5hcm8KZmF0YWw6IGdpdCBjaGVja291dDogdXBkYXRpbmcgcGF0aHMgaXMgaW5j
b21wYXRpYmxlIHdpdGggc3dpdGNoaW5nIGJyYW5jaGVzLgpEaWQgeW91IGludGVuZCB0byBjaGVj
a291dCAnb3JpZ2luL2Rhbm55JyB3aGljaCBjYW4gbm90IGJlIHJlc29sdmVkIGFzIGNvbW1pdD8K
ZmF0YWw6ICdvcmlnaW4vZGFubnknIGRvZXMgbm90IHBvaW50IHRvIGEgY29tbWl0Ck5vdGU6IGNo
ZWNraW5nIG91dCAnZDA1NThmYTQzMDQ1OTI2MjI0MjM1ODJmOGI0NjRlMWMyMmNmZTZmMScuCgpZ
b3UgYXJlIGluICdkZXRhY2hlZCBIRUFEJyBzdGF0ZS4gWW91IGNhbiBsb29rIGFyb3VuZCwgbWFr
ZSBleHBlcmltZW50YWwKY2hhbmdlcyBhbmQgY29tbWl0IHRoZW0sIGFuZCB5b3UgY2FuIGRpc2Nh
cmQgYW55IGNvbW1pdHMgeW91IG1ha2UgaW4gdGhpcwpzdGF0ZSB3aXRob3V0IGltcGFjdGluZyBh
bnkgYnJhbmNoZXMgYnkgcGVyZm9ybWluZyBhbm90aGVyIGNoZWNrb3V0LgoKSWYgeW91IHdhbnQg
dG8gY3JlYXRlIGEgbmV3IGJyYW5jaCB0byByZXRhaW4gY29tbWl0cyB5b3UgY3JlYXRlLCB5b3Ug
bWF5CmRvIHNvIChub3cgb3IgbGF0ZXIpIGJ5IHVzaW5nIC1iIHdpdGggdGhlIGNoZWNrb3V0IGNv
bW1hbmQgYWdhaW4uIEV4YW1wbGU6CgogIGdpdCBjaGVja291dCAtYiBuZXdfYnJhbmNoX25hbWUK
CkhFQUQgaXMgbm93IGF0IGQwNTU4ZmEuLi4gbmV0YmFzZTogcmVtb3ZlIGJiYXBwZW5kCgoKY2xv
bmluZyByZXBvIG9lLWNvcmUKCkZldGNoaW5nIG9lCmZhdGFsOiBnaXQgY2hlY2tvdXQ6IHVwZGF0
aW5nIHBhdGhzIGlzIGluY29tcGF0aWJsZSB3aXRoIHN3aXRjaGluZyBicmFuY2hlcy4KRGlkIHlv
dSBpbnRlbmQgdG8gY2hlY2tvdXQgJ29yaWdpbi9kYW5ueScgd2hpY2ggY2FuIG5vdCBiZSByZXNv
bHZlZCBhcyBjb21taXQ/CmZhdGFsOiAnb3JpZ2luL2Rhbm55JyBkb2VzIG5vdCBwb2ludCB0byBh
IGNvbW1pdApOb3RlOiBjaGVja2luZyBvdXQgJzA3ODU0ODlkNTU4YzM0Y2FjZjVjYjM0OTk0OWEx
NWUyNzA4NGVmYmYnLgoKWW91IGFyZSBpbiAnZGV0YWNoZWQgSEVBRCcgc3RhdGUuIFlvdSBjYW4g
bG9vayBhcm91bmQsIG1ha2UgZXhwZXJpbWVudGFsCmNoYW5nZXMgYW5kIGNvbW1pdCB0aGVtLCBh
bmQgeW91IGNhbiBkaXNjYXJkIGFueSBjb21taXRzIHlvdSBtYWtlIGluIHRoaXMKc3RhdGUgd2l0
aG91dCBpbXBhY3RpbmcgYW55IGJyYW5jaGVzIGJ5IHBlcmZvcm1pbmcgYW5vdGhlciBjaGVja291
dC4KCklmIHlvdSB3YW50IHRvIGNyZWF0ZSBhIG5ldyBicmFuY2ggdG8gcmV0YWluIGNvbW1pdHMg
eW91IGNyZWF0ZSwgeW91IG1heQpkbyBzbyAobm93IG9yIGxhdGVyKSBieSB1c2luZyAtYiB3aXRo
IHRoZSBjaGVja291dCBjb21tYW5kIGFnYWluLiBFeGFtcGxlOgoKICBnaXQgY2hlY2tvdXQgLWIg
bmV3X2JyYW5jaF9uYW1lCgpIRUFEIGlzIG5vdyBhdCAwNzg1NDg5Li4uIGdydWItZWZpLW5hdGl2
ZTogZml4IGJ1aWxkIG9uIG1vZGVybiBkaXN0cmlidXRpb25zIHdpdGhvdXQgZ2V0cygpCgoKIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKVGhlIGJibGF5ZXJzLmNvbmYgY29uZmlndXJhdGlvbiBmaWxl
IGhhcyBiZWVuIGNyZWF0ZWQgZm9yIHlvdSB3aXRoIHNvbWUKZGVmYXVsdCB2YWx1ZXMuICBQbGVh
c2UgdmVyaWZ5IHRoZSBjb250ZW50cyBvZiB5b3VyIGNvbmYvYmJsYXllcnMuY29uZgpmaWxlIGZv
ciBjb3JyZWN0bmVzcy4KCk5PVEU6IEFueSBhZGRpdGlvbmFsIGVudHJpZXMgdG8gdGhpcyBmaWxl
IHdpbGwgYmUgbG9zdCBpZiB0aGUgLi9vZS1sYXllcnRvb2wtc2V0dXAuc2gKICAgICAgc2NyaXB0
IGlzIHJ1biBhZ2Fpbi4gIFRvIGFkZCBlbnRyaWVzIHBlcm1hbmVudGx5IHRvIHRoaXMgZmlsZQog
ICAgICBwbGVhc2UgYWRkIHRoZW0gdG8gdGhlIGNvbmZpZyBmaWxlIHVzZWQgYW5kIHJlcnVuIHRo
ZQogICAgICAuL29lLWxheWVydG9vbC1zZXR1cC5zaCBzY3JpcHQuCgoKCiMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjClRoZSBsb2NhbC5jb25mIGNvbmZpZ3VyYXRpb24gZmlsZSBoYXMgYmVlbiBjcmVh
dGVkIGZvciB5b3Ugd2l0aCBzb21lCmRlZmF1bHQgdmFsdWVzLiAgUGxlYXNlIHZlcmlmeSB0aGUg
Y29udGVudHMgb2YgeW91ciBjb25mL2xvY2FsLmNvbmYKZmlsZSBmb3IgY29ycmVjdG5lc3MuCgpC
eSBkZWZhdWx0IHRoZSBudW1iZXIgb2YgdGhyZWFkcyB1c2VkIGJ5IHRoZSBidWlsZCBpcyBzZXQg
dG8gdGhlIG51bWJlcgpvZiBDUFVzIGZvdW5kIG9uIHlvdXIgc3lzdGVtLgoKTk9URTogWW91IHdp
bGwgcHJvYmFibHkgd2FudCB0byBjaGFuZ2UgdGhlIGRlZmF1bHQgTUFDSElORSBzZXR0aW5nIGlu
IHRoZQogICAgICBsb2NhbC5jb25mIGZpbGUgdG8gdGhlIG1hY2hpbmUgeW91IGFyZSB0cnlpbmcg
dG8gYnVpbGQuCgoKCiMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCkEgc2V0ZW52IGZpbGUgaGFzIGJl
ZW4gY3JlYXRlZCBmb3IgeW91IGluIHRoZSBjb25mIGRpcmVjdG9yeS4gIFBsZWFzZSB2ZXJpZnkK
VGhlIGNvbnRlbnRzIG9mIHRoaXMgZmlsZS4gIE9uY2UgeW91IGhhdmUgdmVyaWZpZWQgdGhlIGNv
bnRlbnRzIHBsZWFzZSBzb3VyY2UKdGhpcyBmaWxlIHRvIGNvbmZpZ3VyZSB5b3VyIGVudmlyb25t
ZW50IGZvciBidWlsZGluZzoKCiAgICAuIGNvbmYvc2V0ZW52CgpZb3UgY2FuIHRoZW4gc3RhcnQg
YnVpbGRpbmcgdXNpbmcgdGhlIGJpdGJha2UgY29tbWFuZC4gIFlvdSB3aWxsIGxpa2VseSB3YW50
CnRvIHNldCB0aGUgTUFDSElORSBvcHRpb24gaWYgeW91IGhhdmUgbm90IGRvbmUgc28gaW4geW91
ciBsb2NhbC5jb25mIGZpbGUuCgpGb3IgZXhhbXBsZToKICAgIE1BQ0hJTkU9eHh4eHggYml0YmFr
ZSA8dGFyZ2V0PgoKQ29tbW9uIHRhcmdldHMgYXJlOgogICAgY29yZS1pbWFnZS1taW5pbWFsCiAg
ICBjb3JlLWltYWdlLXNhdG8KICAgIG1ldGEtdG9vbGNoYWluCiAgICBtZXRhLXRvb2xjaGFpbi1z
ZGsKICAgIGFkdC1pbnN0YWxsZXIKICAgIG1ldGEtaWRlLXN1cHBvcnQKCg==

--089e0112c136f79af104e71cd4e7--
