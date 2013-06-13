Return-Path: <sudhangathan@gmail.com>
Received: from mail-qe0-f53.google.com (mail-qe0-f53.google.com
	[209.85.128.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 008D2E01409
	for <meta-ti@yoctoproject.org>; Thu, 13 Jun 2013 02:52:25 -0700 (PDT)
Received: by mail-qe0-f53.google.com with SMTP id 1so6277491qee.26
	for <meta-ti@yoctoproject.org>; Thu, 13 Jun 2013 02:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kjOyqPZ0fcX8q6yGI/t9COdolheFGmRoCm7GvpyB8X4=;
	b=kb74so2DorBs+IoVzOnF2uFbKxC8FGRnndGYx3GDV2YmaOAtx//yhLJXWdcMo7qydm
	Ov/STVDOELa94yiNcBjQEgoMHNRJKB3OcPM19sYgNfFqSIQo+k99rcF4CZ+pkhSBGpf6
	qR+SpHuWXCygH7/0FqXCmZQpRzzsWaG1XFkTXgsQql81DpF4X/zsFK1TrFlmUINLjJ7Q
	0FOlwXGaEMCx7iSR7f8fM8rbwg8bE2qXNoA36bYCfDk9jkrZGSOr3npd8ysVZz4ygz1b
	jJ94ftjKsJ9yHYmnV5zEO/lOhpKS1Dc1q422Z3lyd81uLwm79WPOLigV1Zt9QopiM+iY
	GEZw==
X-Received: by 10.229.195.2 with SMTP id ea2mr2393qcb.120.1371117144033; Thu,
	13 Jun 2013 02:52:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.88.71 with HTTP; Thu, 13 Jun 2013 02:52:03 -0700 (PDT)
In-Reply-To: <CAP71Wjx=WoR6MAgGpU+nVAGt2Grnk1Y88qOepDjUeyKeX027Ug@mail.gmail.com>
References: <CANwz6nzC4O8bN92q2YCCLtmGKK1S9LwYPLyWR0VZZBY+EiAUtg@mail.gmail.com>
	<CAMUsWmD6F_qEm95q5y92xuP5yg3sNeBm+6GnaMQGOge3CmP8xw@mail.gmail.com>
	<CAP71Wjx=WoR6MAgGpU+nVAGt2Grnk1Y88qOepDjUeyKeX027Ug@mail.gmail.com>
From: Sudhangathan B S <sudhangathan@gmail.com>
Date: Thu, 13 Jun 2013 15:22:03 +0530
Message-ID: <CAGX3a99G=JzBMJ5EB8LyD0_WuvK-2sqbGT1NUDfVi5Lm5z0G4Q@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: Re: [yocto] yocto with meta-ti
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
X-List-Received-Date: Thu, 13 Jun 2013 09:52:27 -0000
Content-Type: multipart/alternative; boundary=089e010d926450d2a004df061604

--089e010d926450d2a004df061604
Content-Type: text/plain; charset=ISO-8859-1

Hello all,

I'm trying to integrate meta-ti with Yocto/poky, since I need to add the
2.6.32 kernel for the beableboard image.

Can I please know how to download the correct version, i.e. i'm using
danny-8.0, so for this, which version of the meta-ti and meta-oe should I
download, and from where.. and also after downloading where should I put
these folders (correct location for each)..

I downloaded the danny branch of yocto, meta-ti, meta-oe and also the danny
branch of openembedded-core as the dependency. Is it correct.?

Is there is weblink that I can follow..?

For now, this is the error i'm getting..

*danny-8.0/build$ bitbake -k core-image-minimal*
*Pseudo is not present but is required, building this first before the main
build*
*WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
with this version of the build system; you may possibly experience
unexpected failures. It is recommended that you use a tested distribution.*
*Loading cache: 100%
|################################################################################################################################|
ETA:  00:00:00*
*Loaded 22 entries from dependency cache.*
*ERROR: ExpansionError during parsing
/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/
ti-local-power-manager_1.24.02.09.bb: Failure expanding variable FILESPATH,
expression was ${@base_set_filespath([
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager-1_24_02_09",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-power-manager",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/files",
"/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager" ],
d)} which triggered exception SyntaxError: EOL while scanning string
literal (FILESPATH, line 1)*
*ERROR: Command execution failed: Exited with 1*
*
*
*Summary: There was 1 WARNING message shown.*
*Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
*

I hope this is not version mismatch problem..!! may be yes..!

---------------------------------
Sudhangathan BS
Ph:(+91) 9731-905-205
---------------------------------


On Wed, Jun 5, 2013 at 11:35 AM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
> On Wed, Jun 5, 2013 at 7:55 AM, Akshay Sahota <akki.sahota@gmail.com>wrote:
>
>> *
>> BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"
>>  #BBMASK = "meta-ti/recipes-misc meta-oe/recipes-graphics"
>> #BBMASK = "meta-oe/recipes-devtools"
>> #BBMASK = "meta-oe/recipes-graphics"
>> #
>> # Parallelism Options*...
>>
>>
>> and bblayers.conf
>>
>> *BBLAYERS ?= " \
>>   /home/asahota/poky-try/poky/meta \
>>   /home/asahota/poky-try/poky/meta-yocto \
>>   /home/asahota/poky-try/poky/meta-yocto-bsp \
>>   /home/asahota/poky-try/poky/meta-ti \
>>   /home/asahota/poky-try/poky/meta-openembedded/meta-oe \
>>   "
>> *
>>
>
> i suspect you are using wrong combination of branch/version, but you don't
> give what branch/version you are using, not cannot confirm.
>
>
>> *
>> BBLAYERS_NON_REMOVABLE ?= " \
>>   /home/asahota/poky-try/poky/meta \
>>   /home/asahota/poky-try/poky/meta-yocto \
>>   "*
>>
>> and the output is :
>> *$ bitbake -k core-image-minimal
>> Pseudo is not present but is required, building this first before the
>> main build
>> WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
>> with this version of the build system; you may possibly experience
>> unexpected failures. It is recommended that you use a tested distribution.
>> ERROR: ParseError at
>> /home/asahota/poky-try/poky/meta-openembedded/meta-oe/recipes-devtools/cloud9/
>> cloud9_0.6.bb:11: Could not inherit file classes/systemd.bbclass
>> *
>>
>
> systemd.bbclass was introduced in 'dylan' version of Yocto (aka 1.4). are
> you sure this is what you are using? to be it sounds like you are using
> Yocto/danny with meta-ti and meta-oe 'master' branch (or dylan branch).
>
>
> *ERROR: Command execution failed: Exited with 1
>>
>> Summary: There was 1 WARNING message shown.
>> Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> code.
>> *
>> What is the mistake, sounds too silly.!
>
>
>
>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
>

--089e010d926450d2a004df061604
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I&#39;m trying to integrate meta-ti with Yocto/poky, since=
 I need to add the 2.6.32 kernel for the beableboard image.</div><div class=
=3D"gmail_extra">


<br></div><div class=3D"gmail_extra">Can I please know how to download the =
correct version, i.e. i&#39;m using danny-8.0, so for this, which version o=
f the meta-ti and meta-oe should I download, and from where.. and also afte=
r downloading where should I put these folders (correct location for each).=
.</div>


<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>I dow=
nloaded the danny branch of yocto, meta-ti, meta-oe and also the danny bran=
ch of openembedded-core as the dependency. Is it correct.?</div><div class=
=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">Is there is weblink that I can follow.=
.?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For=
 now, this is the error i&#39;m getting..</div><div class=3D"gmail_extra"><=
br>
</div>
<div class=3D"gmail_extra"><div class=3D"gmail_extra"><i><font color=3D"#44=
4444">danny-8.0/build$ bitbake -k core-image-minimal</font></i></div><div c=
lass=3D"gmail_extra"><i><font color=3D"#444444">Pseudo is not present but i=
s required, building this first before the main build</font></i></div>

<div class=3D"gmail_extra"><i><font color=3D"#444444">WARNING: Host distrib=
ution &quot;Ubuntu 12.04.2 LTS&quot; has not been validated with this versi=
on of the build system; you may possibly experience unexpected failures. It=
 is recommended that you use a tested distribution.</font></i></div>

<div class=3D"gmail_extra"><i><font color=3D"#444444">Loading cache: 100% |=
###########################################################################=
#####################################################| ETA: =A000:00:00</fo=
nt></i></div>

<div class=3D"gmail_extra"><i><font color=3D"#444444">Loaded 22 entries fro=
m dependency cache.</font></i></div><div class=3D"gmail_extra"><i><font col=
or=3D"#444444">ERROR: ExpansionError during parsing /home/suan/danny-try/da=
nny-8.0/meta-ti/recipes-ti/local-power-manager/<a href=3D"http://ti-local-p=
ower-manager_1.24.02.09.bb">ti-local-power-manager_1.24.02.09.bb</a>: Failu=
re expanding variable FILESPATH, expression was ${@base_set_filespath([ &qu=
ot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti=
-local-power-manager-1_1_24_02_09-${MACHINE_KERNEL_PR}e&quot;, &quot;/home/=
suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-po=
wer-manager-1_24_02_09&quot;, &quot;/home/suan/danny-try/danny-8.0/meta-ti/=
recipes-ti/local-power-manager/ti-local-power-manager&quot;, &quot;/home/su=
an/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/ti-local-powe=
r-manager-1_24_02_09&quot;, &quot;/home/suan/danny-try/danny-8.0/meta-ti/re=
cipes-ti/local-power-manager/ti-local-power-manager&quot;, &quot;/home/suan=
/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager/files&quot;, &q=
uot;/home/suan/danny-try/danny-8.0/meta-ti/recipes-ti/local-power-manager&q=
uot; ], d)} which triggered exception SyntaxError: EOL while scanning strin=
g literal (FILESPATH, line 1)</font></i></div>

<div class=3D"gmail_extra"><i><font color=3D"#444444">ERROR: Command execut=
ion failed: Exited with 1</font></i></div><div class=3D"gmail_extra"><i><fo=
nt color=3D"#444444"><br></font></i></div><div class=3D"gmail_extra"><i><fo=
nt color=3D"#444444">Summary: There was 1 WARNING message shown.</font></i>=
</div>

<div class=3D"gmail_extra"><i><font color=3D"#444444">Summary: There were 2=
 ERROR messages shown, returning a non-zero exit code.</font></i></div></di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>I h=
ope this is not version mismatch problem..!! may be yes..!</div>

<div class=3D"gmail_extra"><br clear=3D"all"><div>-------------------------=
--------<br>Sudhangathan BS<br>Ph:<a href=3D"tel:%28%2B91%29%209731-905-205=
" value=3D"+919731905205" target=3D"_blank">(+91) 9731-905-205</a><br>
---------------------------------</div>
<br><br><div class=3D"gmail_quote">On Wed, Jun 5, 2013 at 11:35 AM, Nicolas=
 Dechesne <span dir=3D"ltr">&lt;<a href=3D"mailto:nicolas.dechesne@linaro.o=
rg" target=3D"_blank">nicolas.dechesne@linaro.org</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">



<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
<div>On Wed, Jun 5, 2013 at 7:55 AM, Akshay Sahota <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:akki.sahota@gmail.com" target=3D"_blank">akki.sahota@gmail.=
com</a>&gt;</span> wrote:<br>





<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div><div><div><i><div>BBMASK ?=3D &quot;.*/meta-ti/recipe=
s-(misc|bsp/formfactor|graphics/mesa)/&quot;<br>





</div>
#BBMASK =3D &quot;meta-ti/recipes-misc meta-oe/recipes-graphics&quot;<br>#B=
BMASK =3D &quot;meta-oe/recipes-devtools&quot;<br>#BBMASK =3D &quot;meta-oe=
/recipes-graphics&quot;<br>#<br># Parallelism Options</i>...<br><br><br></d=
iv>






and bblayers.conf<br><br><i>BBLAYERS ?=3D &quot; \<br>=A0 /home/asahota/pok=
y-try/poky/meta \<br>=A0 /home/asahota/poky-try/poky/meta-yocto \<br>=A0 /h=
ome/asahota/poky-try/poky/meta-yocto-bsp \<br>=A0 /home/asahota/poky-try/po=
ky/meta-ti \<br>






=A0 /home/asahota/poky-try/poky/meta-openembedded/meta-oe \<br>=A0 &quot;<b=
r></i></div></div></blockquote><div><br></div></div><div class=3D"gmail_ext=
ra">i suspect you are using wrong combination of branch/version, but you do=
n&#39;t give what branch/version you are using, not cannot confirm.</div>



<div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div><div><i><br>BBLAYERS_NON_REMOVABLE ?=3D=
 &quot; \<br>





=A0 /home/asahota/poky-try/poky/meta \<br>=A0 /home/asahota/poky-try/poky/m=
eta-yocto \<br>=A0 &quot;</i><br><br>
</div>and the output is :<br><i>$ bitbake -k core-image-minimal<br>Pseudo i=
s not present but is required, building this first before the main build<br=
>WARNING: Host distribution &quot;Ubuntu 12.04.2 LTS&quot; has not been val=
idated with this version of the build system; you may possibly experience u=
nexpected failures. It is recommended that you use a tested distribution.<b=
r>






ERROR: ParseError at /home/asahota/poky-try/poky/meta-openembedded/meta-oe/=
recipes-devtools/cloud9/<a href=3D"http://cloud9_0.6.bb:11" target=3D"_blan=
k">cloud9_0.6.bb:11</a>: Could not inherit file classes/systemd.bbclass<br>





</i></div></blockquote><div>=A0</div></div><div>systemd.bbclass was introdu=
ced in &#39;dylan&#39; version of Yocto (aka 1.4). are you sure this is wha=
t you are using? to be it sounds like you are using Yocto/danny with meta-t=
i and meta-oe &#39;master&#39; branch (or dylan branch).=A0</div>



<div>

<div><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><div><i>ERROR: Command execu=
tion failed: Exited with 1<br>






<br>Summary: There was 1 WARNING message shown.<br>Summary: There were 2 ER=
ROR messages shown, returning a non-zero exit code.<br></i><br></div>What i=
s the mistake, sounds too silly.!</blockquote></div></div><br></div><div cl=
ass=3D"gmail_extra">





<br></div></div>
<br>_______________________________________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproj=
ect.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" target=3D"_blank"=
>https://lists.yoctoproject.org/listinfo/yocto</a><br>
<br></blockquote></div><br></div></div>

--089e010d926450d2a004df061604--
