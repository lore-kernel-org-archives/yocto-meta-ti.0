Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74E72E017BB
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 01:02:48 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9V82mS5005586
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 03:02:48 -0500
Received: from DLEE71.ent.ti.com ([157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V82mbs007827
	for <meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 03:02:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 31 Oct 2013 03:02:47 -0500
Received: from [172.24.158.58] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9V82kCw015540	for
	<meta-ti@yoctoproject.org>; Thu, 31 Oct 2013 03:02:47 -0500
Message-ID: <52720EA6.8000108@ti.com>
Date: Thu, 31 Oct 2013 13:32:46 +0530
From: Siddharth Heroor <heroor@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
References: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
In-Reply-To: <CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com>
Subject: Re: Compile kernel with 4.8 toolchain
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
X-List-Received-Date: Thu, 31 Oct 2013 08:02:51 -0000
Content-Type: multipart/alternative;
	boundary="------------000704070203060002050408"

--------------000704070203060002050408
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/2013 12:32 PM, Kai wrote:
> Hi,
>
> I am trying to compile linux-ti-glsdk kenel with Linaro 4.8 cross 
> compile toolchain, but it cannot boot on OMAP5432 EVM board, no any 
> log from serial port, 4.7 version toolchain is OK. Who has been 
> succeeded with building glsdk kernel with 4.8 Linaro toolchain?

Sorry, we (inside the GLSDK team) haven't tried 4.8 but we have been 
testing with the Linaro 4.7 toolchain only. Any reason for choosing 4.8?

>
> Thanks,
> Kai
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--------------000704070203060002050408
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 10/31/2013 12:32 PM, Kai wrote:<br>
    </div>
    <blockquote
cite="mid:CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>I am trying to compile linux-ti-glsdk kenel with Linaro 4.8
          cross compile toolchain, but it cannot boot on OMAP5432 EVM
          board, no any log from serial port, 4.7 version toolchain is
          OK. Who has been succeeded with building glsdk kernel with 4.8
          Linaro toolchain?</div>
      </div>
    </blockquote>
    <br>
    Sorry, we (inside the GLSDK team) haven't tried 4.8 but we have been
    testing with the Linaro 4.7 toolchain only. Any reason for choosing
    4.8? <br>
    <br>
    <blockquote
cite="mid:CAEhSjjtXtwx_Tbi6=_S38h1V5OAvPvShAWA6ehgdUN0htPcFjA@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div><br>
        </div>
        <div>Thanks,</div>
        <div>Kai</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-ti mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
<a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------000704070203060002050408--
