Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2FE8E0076C; Tue, 19 Aug 2014 07:39:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.192.54 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (diego.sueiro[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3E0CE00744
	for <meta-ti@yoctoproject.org>; Tue, 19 Aug 2014 07:39:28 -0700 (PDT)
Received: by mail-qg0-f54.google.com with SMTP id j5so3231267qga.27
	for <meta-ti@yoctoproject.org>; Tue, 19 Aug 2014 07:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D4M2cJRkbvaf/eNT429Y40TAAByjjOzbfA89SyxTKr4=;
	b=reROAh8ydh60g9OENYEvJ422QWCuoY3gVgzRiFqfNSPipkpnFA+rGWH0ueL7xV/EOz
	xVTCe4v7IfhYIZDCdT/6Fw3gNrhZMK75SVeWBZynRqzzyBN/0ymx/Y4Kds1/9rVCJ7o/
	asE81HTvKLRS1gD6qyQwdbPUrIDht+IAqiie1id5QzjRlUALSZION2grQL+5VtGVqhS4
	q2EXzeq4/NY2VirheW6TxwEVgHXYigFATepXog3/F2Ic4QzALALweqFSXw5cas3m8+c+
	L6iSRoUV8wSmZlm5siepd5z76MdYmxA6U45+9LqzeTH7KUGh/KYmzJtjyxnBc+hY0F4k
	JoJQ==
X-Received: by 10.140.103.75 with SMTP id x69mr60035341qge.17.1408459168263;
	Tue, 19 Aug 2014 07:39:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.83 with HTTP; Tue, 19 Aug 2014 07:39:08 -0700 (PDT)
In-Reply-To: <5087658.bcI9hl3Jbj@localhost.localdomain>
References: <5087658.bcI9hl3Jbj@localhost.localdomain>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 19 Aug 2014 11:39:08 -0300
Message-ID: <CAMCfZKEMsoh1gkR7rj82G5yJFK-DXdEWJC50hieasmFJTsxiyA@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Aug 2014 14:39:40 -0000
Content-Type: multipart/alternative; boundary=001a11c17ab667de910500fc74c7

--001a11c17ab667de910500fc74c7
Content-Type: text/plain; charset=ISO-8859-1

Maciej,

On Tue, Aug 19, 2014 at 6:29 AM, Maciej Borzecki <
maciej.borzecki@open-rnd.pl> wrote:

> Hi all,
>
> There seems to be a problem booting BBB from SD card with uboot 2014.07
> from
> meta-ti, 2013.07 from yocto seems to work.
> The card is partitioned as follows:
>
> Device         Boot     Start       End Blocks  Id System
> /dev/mmcblk0p1 *         2048     22527 10240   c W95 FAT32 (LBA)
> /dev/mmcblk0p2          22528    227327 102400  83 Linux
>
> I've already tried different cards.
>
> This is all I get on the serial console:
>
> U-Boot SPL 2014.07 (Aug 19 2014 - 10:45:01)
> MMC: block number 0x100 exceeds max(0x0)
> MMC: block number 0x200 exceeds max(0x0)
> *** Error - No Valid Environment Area found
> Using default environment
>
> MMC: block number 0x1 exceeds max(0x0)
> ** Can't read partition table on 0:0 **
> ** Partition 1 not valid on device 0 **
> spl_register_fat_device: fat register err - -1
> ### ERROR ### Please RESET the board ###
>
> --
>

I don't have this issue on SD card, bug I'm facing with another error when
MLO is installed on eMMC. This is my error message:

U-Boot SPL 2014.07 (Aug 13 2014 - 08:23:53)
omap_hsmmc_send_cmd: timedout waiting on cmd inhibit to clear
spl: mmc init failed: err - -19
### ERROR ### Please RESET the board ###

Anyone have tested the MLO on eMMC?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c17ab667de910500fc74c7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Maciej,</div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Tue, Aug 19, 2014 at 6:29 AM, Ma=
ciej Borzecki <span dir=3D"ltr">&lt;<a href=3D"mailto:maciej.borzecki@open-=
rnd.pl" target=3D"_blank">maciej.borzecki@open-rnd.pl</a>&gt;</span> wrote:=
<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":62" class=3D"" style=3D"overflow:hidden">Hi al=
l,<br>


<br>
There seems to be a problem booting BBB from SD card with uboot 2014.07 fro=
m<br>
meta-ti, 2013.07 from yocto seems to work.<br>
The card is partitioned as follows:<br>
<br>
Device=A0 =A0 =A0 =A0 =A0Boot=A0 =A0 =A0Start=A0 =A0 =A0 =A0End Blocks=A0 I=
d System<br>
/dev/mmcblk0p1 *=A0 =A0 =A0 =A0 =A02048=A0 =A0 =A0<a href=3D"tel:22527%20%2=
010240" value=3D"+12252710240">22527  10240</a>=A0 =A0c W95 FAT32 (LBA)<br>
/dev/mmcblk0p2=A0 =A0 =A0 =A0 =A0 22528=A0 =A0 227327 102400=A0 83 Linux<br=
>
<br>
I&#39;ve already tried different cards.<br>
<br>
This is all I get on the serial console:<br>
<br>
U-Boot SPL 2014.07 (Aug 19 2014 - 10:45:01)<br>
MMC: block number 0x100 exceeds max(0x0)<br>
MMC: block number 0x200 exceeds max(0x0)<br>
*** Error - No Valid Environment Area found<br>
Using default environment<br>
<br>
MMC: block number 0x1 exceeds max(0x0)<br>
** Can&#39;t read partition table on 0:0 **<br>
** Partition 1 not valid on device 0 **<br>
spl_register_fat_device: fat register err - -1<br>
### ERROR ### Please RESET the board ###<br>
<br>
--</div></blockquote></div><br>I don&#39;t have this issue on SD card, bug =
I&#39;m facing with another error when MLO is installed on eMMC. This is my=
 error message:</div><div class=3D"gmail_extra"><blockquote style=3D"margin=
:0px 0px 0px 40px;border:none;padding:0px">

<div class=3D"gmail_extra"><div class=3D"gmail_extra">U-Boot SPL 2014.07 (A=
ug 13 2014 - 08:23:53)</div><div class=3D"gmail_extra">omap_hsmmc_send_cmd:=
 timedout waiting on cmd inhibit to clear</div><div class=3D"gmail_extra">s=
pl: mmc init failed: err - -19</div>

<div class=3D"gmail_extra">### ERROR ### Please RESET the board ###</div><d=
iv class=3D"gmail_extra"><br></div></div></blockquote>Anyone have tested th=
e MLO on eMMC?<br><br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,=
</div>

<div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados=
<br><a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&=
amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" targ=
et=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c17ab667de910500fc74c7--
