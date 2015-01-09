Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58D4FE0086E; Fri,  9 Jan 2015 02:41:51 -0800 (PST)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.45 listed in list.dnswl.org]
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 307D9E004D6
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 02:41:41 -0800 (PST)
Received: by mail-qg0-f45.google.com with SMTP id z107so7766485qgd.4
	for <meta-ti@yoctoproject.org>; Fri, 09 Jan 2015 02:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=58OdW1g9n/vI1IjsJ4BK2MKGVO9iuFulWmQMsSISWic=;
	b=cUDfvMW3O3olWHxz4qswhMR2qHKdD2y5oKFPsQpjYomjowNfLDXj8rlpRte1fjATFg
	YFAXq1W7nIBjGQWCu3bQ0bjlbcuGSdEgc5KkqFEX2qDiXhRbeY6nTuVVslaUWQaPpS6i
	UkuqzpSNuJhzYGJ6IZv1c/ZkRAG7eSpIQNfd/a2FFz2gyRGNECmrTCcpFFbkBMu4Aa3b
	L9YdHhNGA3eVXlia3ie/VWDldAAKX6AQLiJGwF5MZXFm3wUTtLotT0xUQ15wAIY/omD6
	tU9QYKkK10DM3sJ18CJ+Fr4ax+4mMkLIQbHVOO8yzIrUWqw3IJfEP3XwE3SbF2xX3Pzq
	xW7A==
X-Received: by 10.224.63.70 with SMTP id a6mr21943803qai.42.1420800100608;
	Fri, 09 Jan 2015 02:41:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.44.10 with HTTP; Fri, 9 Jan 2015 02:41:19 -0800 (PST)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Fri, 9 Jan 2015 08:41:19 -0200
Message-ID: <CAMCfZKH_-v_S=mLiNLQVRZ_YmUYZgz1a6q8h_ZX5VRqfwjiESQ@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: pvrsrvkm failing on kernel 3.14.26 for am3359
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
X-List-Received-Date: Fri, 09 Jan 2015 10:41:51 -0000
Content-Type: multipart/alternative; boundary=047d7bdca1004b320e050c35cd41

--047d7bdca1004b320e050c35cd41
Content-Type: text/plain; charset=ISO-8859-1

Folks,

I have recently updated my meta-ti daisy branch and noticed that
omap3-sgx-modules are not being loaded.

Here is the log for 3.14.26 kernel (from meta-ti commit
1d46274416c3b50808590963bdb6c157d9d7c745):

pvrsrvkm: Unknown symbol v7_dma_map_area (err 0)
pvrsrvkm: Unknown symbol v7_dma_flush_range (err 0)
insmod: ERROR: could not insert module
/lib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown symbol in
module
Could not find pvrsrvkm driver


The 3.14.25 kernel version (from meta-ti commit
31348244882a8defb640af75119ba275d9915f09) is OK.

I'm using the default kernel configuration.


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--047d7bdca1004b320e050c35cd41
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Folks,</div><div><br></div><div>I have recently updat=
ed my meta-ti daisy branch and noticed that omap3-sgx-modules are not being=
 loaded.</div><div><br></div><div>Here is the log for 3.14.26 kernel (from =
meta-ti commit 1d46274416c3b50808590963bdb6c157d9d7c745):</div><blockquote =
style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div>pvrsrvkm: Un=
known symbol v7_dma_map_area (err 0)</div><div>pvrsrvkm: Unknown symbol v7_=
dma_flush_range (err 0)</div><div>insmod: ERROR: could not insert module /l=
ib/modules/3.14.26/kernel/drivers/gpu/pvr/pvrsrvkm.ko: Unknown symbol in mo=
dule</div><div>Could not find pvrsrvkm driver</div></blockquote><div><br></=
div><div>The 3.14.25 kernel version (from meta-ti commit 31348244882a8defb6=
40af75119ba275d9915f09) is OK.<br></div><div><br></div><div>I&#39;m using t=
he default kernel configuration.</div><div><br></div><div><br></div><div><d=
iv><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Su=
eiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.embarcados=
.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_camp=
aign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br<=
/a><br><br>/*long live rock &#39;n roll*/<br></div></div></div>
</div>

--047d7bdca1004b320e050c35cd41--
