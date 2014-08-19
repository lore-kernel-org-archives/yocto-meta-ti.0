Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D369E00805; Tue, 19 Aug 2014 13:00:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.175 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6172E00655
	for <meta-ti@yoctoproject.org>; Tue, 19 Aug 2014 13:00:30 -0700 (PDT)
Received: by mail-qc0-f175.google.com with SMTP id w7so6749933qcr.6
	for <meta-ti@yoctoproject.org>; Tue, 19 Aug 2014 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=EX4fgWW2UPK5D5mdME5TIEFoIdIUQeQ4Bv8J0OW4la8=;
	b=EbuXwMwrRrwpiY854DfRBeBxhy2u0JDUQiOQW2UcbTUdUF26/2JMuhVq/P30Jyjlq3
	G5cTFjrYlWq6g/iCY6cx/aGDmwgFz4ofGadZUmUKxXAmHTApobQN3YDP2uo/Mi/U4pei
	LOtCyh55vtd0KRyONdz5h41KVxhef6YRfg/PLX2eHc7moLOrMEFonGiEh0EuqfRSw2Ni
	B19rcNzuqpcdMsLclcrZ+wRyhZ7dW4Tao8o7fx5tn0M7lXxzNIh/OK70hnTf1IVQ6B/L
	N6Ybcvxgv0dVthMCzc3/KQeZ5Wq029p0Uep5KADQGoVNm5iFizmKDStzHwkjskhD9ist
	auiw==
X-Received: by 10.224.97.66 with SMTP id k2mr70523609qan.21.1408478427410;
	Tue, 19 Aug 2014 13:00:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Tue, 19 Aug 2014 13:00:07 -0700 (PDT)
In-Reply-To: <CAMCfZKEMsoh1gkR7rj82G5yJFK-DXdEWJC50hieasmFJTsxiyA@mail.gmail.com>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
	<CAMCfZKEMsoh1gkR7rj82G5yJFK-DXdEWJC50hieasmFJTsxiyA@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 19 Aug 2014 17:00:07 -0300
Message-ID: <CAMCfZKFdtGbnGLR86D-PfsQ1hXJ=pKCqsf7HvKt1wgmAzz=XBg@mail.gmail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BBB + uboot 2014.07 - not booting
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
X-List-Received-Date: Tue, 19 Aug 2014 20:00:37 -0000
Content-Type: multipart/alternative; boundary=001a11c3ef4656f9fb050100f04d

--001a11c3ef4656f9fb050100f04d
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 19, 2014 at 11:39 AM, Diego Sueiro <diego.sueiro@gmail.com>
wrote:

>
> I don't have this issue on SD card, bug I'm facing with another error when
> MLO is installed on eMMC. This is my error message:
>
> U-Boot SPL 2014.07 (Aug 13 2014 - 08:23:53)
> omap_hsmmc_send_cmd: timedout waiting on cmd inhibit to clear
> spl: mmc init failed: err - -19
>  ### ERROR ### Please RESET the board ###
>
> Anyone have tested the MLO on eMMC?
>

I did some tests using yocto and meta-ti on daisy branch (beaglebone black)
using u-boot_2014.07.bb (upstream) and u-boot-ti-staging_2014.07.bb
recipes. And the results:

   - u-boot_2014.07: MLO works on SDcard and eMMC(2GB)
   - u-boot-ti-staging: MLO works on eMMC(2GB), but fails on SDcard

I did not tracked the differences yet.

Could someone test the MLO on eMMC for u-boot-ti-staging(v2014.07)?


Regards,


--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c3ef4656f9fb050100f04d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Aug 19, 2014 at 11:39 AM, Diego Sueiro <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:diego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.co=
m</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"gmail_extra"><div class=3D""><br></div>I don=
&#39;t have this issue on SD card, bug I&#39;m facing with another error wh=
en MLO is installed on eMMC. This is my error message:</div>

<div class=3D"gmail_extra"><blockquote style=3D"margin:0px 0px 0px 40px;bor=
der:none;padding:0px">
<div class=3D"gmail_extra"><div class=3D"gmail_extra">U-Boot SPL 2014.07 (A=
ug 13 2014 - 08:23:53)</div><div class=3D"gmail_extra">omap_hsmmc_send_cmd:=
 timedout waiting on cmd inhibit to clear</div><div class=3D"gmail_extra">s=
pl: mmc init failed: err - -19</div>

<div class=3D"">
<div class=3D"gmail_extra">### ERROR ### Please RESET the board ###</div><d=
iv class=3D"gmail_extra"><br></div></div></div></blockquote>Anyone have tes=
ted the MLO on eMMC?</div></blockquote></div><br>I did some tests using yoc=
to and meta-ti on daisy branch (beaglebone black) using <a href=3D"http://u=
-boot_2014.07.bb">u-boot_2014.07.bb</a> (upstream) and=A0<a href=3D"http://=
u-boot-ti-staging_2014.07.bb">u-boot-ti-staging_2014.07.bb</a> recipes. And=
 the results:</div>

<div class=3D"gmail_extra"><ul><li>u-boot_2014.07: MLO works on SDcard and =
eMMC(2GB)<br></li><li>u-boot-ti-staging: MLO works on=A0eMMC(2GB), but fail=
s on SDcard<br></li></ul></div><div class=3D"gmail_extra">I did not tracked=
 the differences yet.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Could someo=
ne test the MLO on eMMC for u-boot-ti-staging(v2014.07)?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">

<div><div dir=3D"ltr">Regards,<br><div><br></div><div><br></div>--<br>*dS<b=
r>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.=
embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&am=
p;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcad=
os.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c3ef4656f9fb050100f04d--
