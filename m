Subject: Re: Inverted colors in Qt application with beaglebone/am335x and QT_QPA_PLATFORM=eglfs
To: meta-ti@lists.yoctoproject.org
From: "Luca" <magnabosco.luca@gmail.com>
X-Originating-Location: Trissino, Veneto, IT (94.126.15.98)
X-Originating-Platform: Windows Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Jun 2020 01:20:44 -0700
References: <20200608201641.GA10922@beryl>
In-Reply-To: <20200608201641.GA10922@beryl>
Message-ID: <3959.1591690844731403041@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="FQYaST2hSuHIlp8oDjYz"

--FQYaST2hSuHIlp8oDjYz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

thanks for your reply.

>=20
> Thank you for your report. There have been few similar reports on TI E2E=
 forums
> ( https://e2e.ti.com/ ) and our team is looking into this issue. You mig=
ht
> want to follow corresponding discussions there for any latest updates, b=
ut
> once this gets resolved, it will be picked up by meta-ti.
>=20

Thanks for the suggestion, I checked TI E2E forum before posting to meta-t=
i and I haven't found the similar reports you are referring to.
A few similar questions seem outdated and not using the latest GPU drivers=
 that can be compiled from a recent version of meta-ti layer.
Could you please point me to the right/updated pages/questions?

I am not sure that this is useful but I saw this recent question http://e2=
e.ti.com/support/processors/f/791/t/844810?AM3358-Qt-build-issue
and I am surprised for 2 reasons:
* I haven't had the reported build issue even though I compiled the same v=
ersion of qtwebengine
* the question does not mention the color issue even though it seems to us=
e a QT application and the eglfs platform plugin

>=20
> One more note - there are no more updates planned for "zeus" branch, as =
we
> have migrated to the latest LTS release "dunfell".

Thanks for the suggestion, I will migrate to "dunfell" then.
Anyway I probably miss something:
Is there a recent version of meta-ti that is "ensured" to use the GPU for =
QT based applications?
Just to be clear, my "ideal" requirements would be:
- kernel >=3D 5.4=C2=A0 (patched or that can be patched for RT)
- GPU working fine with QT applications
- specific interest in qtwebengine working properly

Regards
Luca

--FQYaST2hSuHIlp8oDjYz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Denys,<br /><br />thanks for your reply.<br /><br />
<blockquote><span style=3D"white-space: pre-wrap;">Thank you for your repo=
rt. There have been few similar reports on TI E2E </span><span style=3D"whi=
te-space: pre-wrap;">forums (</span><a style=3D"background-color: #ffffff; =
white-space: pre-wrap;" href=3D"https://e2e.ti.com/" target=3D"_blank" rel=
=3D"noopener">https://e2e.ti.com/</a><span style=3D"white-space: pre-wrap;=
">) and our team is looking into this issue. You </span><span style=3D"whit=
e-space: pre-wrap;">might want to follow corresponding discussions there fo=
r any latest updates, </span><span style=3D"white-space: pre-wrap;">but onc=
e this gets resolved, it will be picked up by meta-ti.<br /></span></blockq=
uote>
Thanks for the suggestion, I checked TI E2E forum before posting to meta-t=
i and I haven't found the similar reports you are referring to.<br />A few =
similar questions seem outdated and not using the latest GPU drivers that c=
an be compiled from a recent version of meta-ti layer.<br />Could you pleas=
e point me to the right/updated pages/questions?<br /><br />I am not sure t=
hat this is useful but I saw this recent question&nbsp;<span id=3D"docs-int=
ernal-guid-fed7e6f5-7fff-bcbe-c18e-3a97d839e066"><span style=3D"font-size: =
12pt; font-family: Arial; color: #1155cc; background-color: #f9f9f9; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; text-decoration-li=
ne: underline; text-decoration-skip-ink: none; vertical-align: baseline; wh=
ite-space: pre-wrap;"><a href=3D"http://e2e.ti.com/support/processors/f/791=
/t/844810?AM3358-Qt-build-issue" target=3D"_blank" rel=3D"noopener">http://=
e2e.ti.com/support/processors/f/791/t/844810?AM3358-Qt-build-issue</a><br /=
></span></span>and I am surprised for 2 reasons:<br />
<ol>
<li>I haven't had the reported build issue even though I compiled the same=
 version of qtwebengine</li>
<li>the question does not mention the color issue even though it seems to =
use a QT application and the eglfs platform plugin&nbsp;</li>
</ol>
<br />
<blockquote><span style=3D"white-space: pre-wrap;">One more note - there a=
re no more updates planned for "zeus" branch, as we </span><span style=3D"w=
hite-space: pre-wrap;">have migrated to the latest LTS release "dunfell".</=
span></blockquote>
Thanks for the suggestion, I will migrate to "dunfell" then.<br />Anyway I=
 probably miss something:<br />Is there a recent version of meta-ti that is=
 "ensured" to use the GPU for QT based applications?<br />Just to be clear,=
 my "ideal" requirements would be:<br />- kernel &gt;=3D 5.4&nbsp; (patched=
 or that can be patched for RT)<br />- GPU working fine with QT application=
s<br />- specific interest in qtwebengine working properly<br /><br />Regar=
ds<br />Luca

--FQYaST2hSuHIlp8oDjYz--
