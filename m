Subject: dunfell kernel 5.10 ti-sgx-ddk-km kernel errors at boot
To: meta-ti@lists.yoctoproject.org
From: "Michael" <kakuschky@elbe-net.de>
X-Originating-Location: DE (165.225.27.99)
X-Originating-Platform: Windows Firefox 90
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 11 Aug 2021 08:08:51 -0700
Message-ID: <EiRi.1628694531238614074.IC29@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="zDhN77pYHsU0H8wUtLGu"

--zDhN77pYHsU0H8wUtLGu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The kernel 5.10 and ti-sgx-ddk-km build know and I can create an image.

Now I still have two problems and need some advice what I'm doing wrong or =
how to fix these issues.

1.) The sgx section of my dts file is not recognized

&sgx {
status =3D "okay";
};

I got the error "Label or path sgx not found". In older version it was reco=
gnized.

2.) When booting with a dts without sgx section the created image SGX Kerne=
l module is started and produced some errors

[=C2=A0=C2=A0 12.480473] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match=
. [ OK ]
[=C2=A0=C2=A0 13.484084] PVR_K:(Error): PollForValueKM: Timeout. Expected 0=
x1 but found 0x0 (mask 0x1).
[=C2=A0=C2=A0 13.492411] PVR_K:(Error): SGXInitialise: Wait for uKernel ini=
tialisation failed
[=C2=A0=C2=A0 13.499873] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)
[=C2=A0=C2=A0 13.505396] PVR_K:=C2=A0 Host Ctl flags=3D 00000006
[=C2=A0=C2=A0 13.509683] PVR_K: SGX Host control:
[=C2=A0=C2=A0 13.513274] PVR_K:=C2=A0=C2=A0 (HC-0) 0x00000000 0x00000000 0x=
00000000 0x00000000
[=C2=A0=C2=A0 13.519858] PVR_K:=C2=A0=C2=A0 (HC-10) 0x00000000 0x00000000 0=
x00000014 0x00030D40
[=C2=A0=C2=A0 13.526514] PVR_K:=C2=A0=C2=A0 (HC-20) 0x00000000 0x00000000 0=
x00000000 0x00000000
[=C2=A0=C2=A0 13.533159] PVR_K:=C2=A0=C2=A0 (HC-30) 0x00000000 0x00000000 0=
xEEDCCB00 0x00000000
[=C2=A0=C2=A0 13.539825] PVR_K:=C2=A0=C2=A0 (HC-40) 0x00000000 0x00000000 0=
x00000000 0x00000000
[=C2=A0=C2=A0 13.546483] PVR_K: SGX TA/3D control:
[=C2=A0=C2=A0 13.550164] PVR_K:=C2=A0=C2=A0 (T3C-0) 0x0F003000 0x0F003140 0=
x0F002000 0x00000000
[=C2=A0=C2=A0 13.556818] PVR_K:=C2=A0=C2=A0 (T3C-10) 0x00000000 0x00000000 =
0x00000002 0x00000000
[=C2=A0=C2=A0 13.563549] PVR_K:=C2=A0=C2=A0 (T3C-20) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.570303] PVR_K:=C2=A0=C2=A0 (T3C-30) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.577046] PVR_K:=C2=A0=C2=A0 (T3C-40) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.583778] PVR_K:=C2=A0=C2=A0 (T3C-50) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.590532] PVR_K:=C2=A0=C2=A0 (T3C-60) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.597276] PVR_K:=C2=A0=C2=A0 (T3C-70) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.604032] PVR_K:=C2=A0=C2=A0 (T3C-80) 0x00000000 0x00000000 =
0x00000000 0x0F000000
[=C2=A0=C2=A0 13.610764] PVR_K:=C2=A0=C2=A0 (T3C-90) 0x828CF000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.617506] PVR_K:=C2=A0=C2=A0 (T3C-A0) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.624260] PVR_K:=C2=A0=C2=A0 (T3C-B0) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.630993] PVR_K:=C2=A0=C2=A0 (T3C-C0) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.637736] PVR_K:=C2=A0=C2=A0 (T3C-D0) 0x0F000000 0x8000B000 =
0x8004B000 0x0F004000
[=C2=A0=C2=A0 13.644490] PVR_K:=C2=A0=C2=A0 (T3C-E0) 0x0F00A420 0x0F00A740 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.651222] PVR_K:=C2=A0=C2=A0 (T3C-F0) 0x00000000 0x00000000 =
0x00000000 0x00000000
[=C2=A0=C2=A0 13.657965] PVR_K:=C2=A0=C2=A0 (T3C-100) 0x00000000 0x00000000=
 0x00000000 0x00000000
[=C2=A0=C2=A0 13.672226] PVR_K:=C2=A0=C2=A0 (T3C-110) 0x00000000 0x00000000=
 0x00000000 0x00000000
[=C2=A0=C2=A0 13.679215] PVR_K:=C2=A0=C2=A0 (T3C-120) 0x00000000 0x00000000=
 0x00000000 0x00000000
[=C2=A0=C2=A0 13.686113] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
[=C2=A0=C2=A0 13.690667] PVR_K: Active syncs
[=C2=A0=C2=A0 13.693825] PVR_K:(Error): SGXPostPowerState: SGXInitialise fa=
iled
[=C2=A0=C2=A0 13.700303] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Trans=
ition to 0 FAILED 0x18
[=C2=A0=C2=A0 13.708147] PVR_K:(Error): SGXScheduleCCBCommandKM failed to p=
ower up device - ui32CallerID:-1 eError:24
[=C2=A0=C2=A0 13.717696] PVR_K:(Error): SGXGetMiscInfoUkernel: SGXScheduleC=
CBCommandKM failed.
[=C2=A0=C2=A0 13.725223] PVR_K: (FAIL) SGXInit: Unable to validate hardware=
 core revision
[=C2=A0=C2=A0 13.732306] PVR_K:(Error): PVRSRVFinaliseSystem: Failed PVRSRV=
DevInitCompatCheck call (device index: 0)
PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][=C2=A0=C2=A0 13.=
742023] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.=C2=A0 Driv=
er unusable.

PVR:(Error): PVRSRVBridgeCall: Failed to access device.=C2=A0 Function ID:3=
223086862 (strerror returns no value.). [0, ]

My current config I'm using for this is

defconfig:

#
# Graphics support
#
# CONFIG_VGA_ARB is not set
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=3Dm
# CONFIG_DRM_DP_AUX_CHARDEV is not set
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=3Dm
CONFIG_DRM_KMS_FB_HELPER=3Dy
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_FBDEV_EMULATION=3Dy
CONFIG_DRM_FBDEV_OVERALLOC=3D100
# CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_GEM_CMA_HELPER=3Dy
CONFIG_DRM_KMS_CMA_HELPER=3Dy
CONFIG_DRM_VM=3Dy

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=3Dm
# CONFIG_DRM_I2C_NXP_TDA9950 is not set
# end of I2C encoder or helper chips

# ARM devices
#
# CONFIG_DRM_HDLCD is not set
# CONFIG_DRM_MALI_DISPLAY is not set
# CONFIG_DRM_KOMEDA is not set
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_VGEM is not set
# CONFIG_DRM_VKMS is not set
# CONFIG_DRM_EXYNOS is not set
# CONFIG_DRM_UDL is not set
# CONFIG_DRM_AST is not set
# CONFIG_DRM_MGAG200 is not set
# CONFIG_DRM_ARMADA is not set
# CONFIG_DRM_RCAR_DW_HDMI is not set
# CONFIG_DRM_RCAR_LVDS is not set
CONFIG_DRM_OMAP=3Dm
CONFIG_OMAP2_DSS_INIT=3Dy
CONFIG_OMAP_DSS_BASE=3Dm
CONFIG_OMAP2_DSS=3Dm
CONFIG_OMAP2_DSS_DEBUG=3Dy
CONFIG_OMAP2_DSS_DEBUGFS=3Dy
CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS=3Dy
CONFIG_OMAP2_DSS_DPI=3Dy
CONFIG_OMAP2_DSS_VENC=3Dy
CONFIG_OMAP2_DSS_HDMI_COMMON=3Dy
CONFIG_OMAP4_DSS_HDMI=3Dy
CONFIG_OMAP4_DSS_HDMI_CEC=3Dy
CONFIG_OMAP5_DSS_HDMI=3Dy
# CONFIG_OMAP2_DSS_SDI is not set
# CONFIG_OMAP2_DSS_DSI is not set
CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=3D0
CONFIG_OMAP2_DSS_SLEEP_AFTER_VENC_RESET=3Dy

local.conf:

MACHINE_EXTRA_RDEPENDS +=3D "ti-sgx-ddk-km"

IMAGE_INSTALL_append =3D " ti-sgx-ddk-km ti-sgx-ddk-um libdrm libdrm-tests"

DEPENDS_remove =3D "virtual/libgl"

PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/libgbm =3D "ti-sgx-ddk-um"
PREFERRED_PROVIDER_virtual/gpudriver =3D "ti-sgx-ddk-km"

--zDhN77pYHsU0H8wUtLGu
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The kernel 5.10 and ti-sgx-ddk-km build know and I can create an image. <br=
 /><br />Now I still have two problems and need some advice what I'm doing =
wrong or how to fix these issues.<br /><br />1.) The sgx section of my dts =
file is not recognized<br /><br />&amp;sgx {<br />&nbsp;&nbsp; status =3D "=
okay";<br />};<br /><br />I got the error "Label or path sgx not found". In=
 older version it was recognized.<br /><br /><br />2.) When booting with a =
dts without sgx section the created image SGX Kernel module is started and =
produced some errors<br /><br />[&nbsp;&nbsp; 12.480473] PVR_K: UM DDK-(494=
8957) and KM DDK-(4948957) match. [ OK ]<br />[&nbsp;&nbsp; 13.484084] PVR_=
K:(Error): PollForValueKM: Timeout. Expected 0x1 but found 0x0 (mask 0x1).<=
br />[&nbsp;&nbsp; 13.492411] PVR_K:(Error): SGXInitialise: Wait for uKerne=
l initialisation failed<br />[&nbsp;&nbsp; 13.499873] PVR_K: SGX debug (SGX=
_DDK sgxddk 1.17@4948957)<br />[&nbsp;&nbsp; 13.505396] PVR_K:&nbsp; Host C=
tl flags=3D 00000006<br />[&nbsp;&nbsp; 13.509683] PVR_K: SGX Host control:=
<br />[&nbsp;&nbsp; 13.513274] PVR_K:&nbsp;&nbsp; (HC-0) 0x00000000 0x00000=
000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.519858] PVR_K:&nbsp;&nbsp; =
(HC-10) 0x00000000 0x00000000 0x00000014 0x00030D40<br />[&nbsp;&nbsp; 13.5=
26514] PVR_K:&nbsp;&nbsp; (HC-20) 0x00000000 0x00000000 0x00000000 0x000000=
00<br />[&nbsp;&nbsp; 13.533159] PVR_K:&nbsp;&nbsp; (HC-30) 0x00000000 0x00=
000000 0xEEDCCB00 0x00000000<br />[&nbsp;&nbsp; 13.539825] PVR_K:&nbsp;&nbs=
p; (HC-40) 0x00000000 0x00000000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 1=
3.546483] PVR_K: SGX TA/3D control:<br />[&nbsp;&nbsp; 13.550164] PVR_K:&nb=
sp;&nbsp; (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000<br />[&nbsp;&=
nbsp; 13.556818] PVR_K:&nbsp;&nbsp; (T3C-10) 0x00000000 0x00000000 0x000000=
02 0x00000000<br />[&nbsp;&nbsp; 13.563549] PVR_K:&nbsp;&nbsp; (T3C-20) 0x0=
0000000 0x00000000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.570303] PVR_=
K:&nbsp;&nbsp; (T3C-30) 0x00000000 0x00000000 0x00000000 0x00000000<br />[&=
nbsp;&nbsp; 13.577046] PVR_K:&nbsp;&nbsp; (T3C-40) 0x00000000 0x00000000 0x=
00000000 0x00000000<br />[&nbsp;&nbsp; 13.583778] PVR_K:&nbsp;&nbsp; (T3C-5=
0) 0x00000000 0x00000000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.590532=
] PVR_K:&nbsp;&nbsp; (T3C-60) 0x00000000 0x00000000 0x00000000 0x00000000<b=
r />[&nbsp;&nbsp; 13.597276] PVR_K:&nbsp;&nbsp; (T3C-70) 0x00000000 0x00000=
000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.604032] PVR_K:&nbsp;&nbsp; =
(T3C-80) 0x00000000 0x00000000 0x00000000 0x0F000000<br />[&nbsp;&nbsp; 13.=
610764] PVR_K:&nbsp;&nbsp; (T3C-90) 0x828CF000 0x00000000 0x00000000 0x0000=
0000<br />[&nbsp;&nbsp; 13.617506] PVR_K:&nbsp;&nbsp; (T3C-A0) 0x00000000 0=
x00000000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.624260] PVR_K:&nbsp;&=
nbsp; (T3C-B0) 0x00000000 0x00000000 0x00000000 0x00000000<br />[&nbsp;&nbs=
p; 13.630993] PVR_K:&nbsp;&nbsp; (T3C-C0) 0x00000000 0x00000000 0x00000000 =
0x00000000<br />[&nbsp;&nbsp; 13.637736] PVR_K:&nbsp;&nbsp; (T3C-D0) 0x0F00=
0000 0x8000B000 0x8004B000 0x0F004000<br />[&nbsp;&nbsp; 13.644490] PVR_K:&=
nbsp;&nbsp; (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000 0x00000000<br />[&nbs=
p;&nbsp; 13.651222] PVR_K:&nbsp;&nbsp; (T3C-F0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br />[&nbsp;&nbsp; 13.657965] PVR_K:&nbsp;&nbsp; (T3C-100)=
 0x00000000 0x00000000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.672226] =
PVR_K:&nbsp;&nbsp; (T3C-110) 0x00000000 0x00000000 0x00000000 0x00000000<br=
 />[&nbsp;&nbsp; 13.679215] PVR_K:&nbsp;&nbsp; (T3C-120) 0x00000000 0x00000=
000 0x00000000 0x00000000<br />[&nbsp;&nbsp; 13.686113] PVR_K: SGX Kernel C=
CB WO:0x0 RO:0x0<br />[&nbsp;&nbsp; 13.690667] PVR_K: Active syncs<br />[&n=
bsp;&nbsp; 13.693825] PVR_K:(Error): SGXPostPowerState: SGXInitialise faile=
d<br />[&nbsp;&nbsp; 13.700303] PVR_K:(Error): PVRSRVSetDevicePowerStateKM =
: Transition to 0 FAILED 0x18<br />[&nbsp;&nbsp; 13.708147] PVR_K:(Error): =
SGXScheduleCCBCommandKM failed to power up device - ui32CallerID:-1 eError:=
24<br />[&nbsp;&nbsp; 13.717696] PVR_K:(Error): SGXGetMiscInfoUkernel: SGXS=
cheduleCCBCommandKM failed.<br />[&nbsp;&nbsp; 13.725223] PVR_K: (FAIL) SGX=
Init: Unable to validate hardware core revision<br />[&nbsp;&nbsp; 13.73230=
6] PVR_K:(Error): PVRSRVFinaliseSystem: Failed PVRSRVDevInitCompatCheck cal=
l (device index: 0)<br />PVR:(Error): PVRSRVInitSrvDisconnect: KM returned =
24 [0, ][&nbsp;&nbsp; 13.742023] PVR_K:(Error): BridgedDispatchKM: Initiali=
sation failed.&nbsp; Driver unusable.<br /><br />PVR:(Error): PVRSRVBridgeC=
all: Failed to access device.&nbsp; Function ID:3223086862 (strerror return=
s no value.). [0, ]<br /><br /><br /><br />My current config I'm using for =
this is<br /><br />defconfig:<br /><br />#<br /># Graphics support<br />#<b=
r /># CONFIG_VGA_ARB is not set<br /># CONFIG_IMX_IPUV3_CORE is not set<br =
/>CONFIG_DRM=3Dm<br /># CONFIG_DRM_DP_AUX_CHARDEV is not set<br /># CONFIG_=
DRM_DEBUG_SELFTEST is not set<br />CONFIG_DRM_KMS_HELPER=3Dm<br />CONFIG_DR=
M_KMS_FB_HELPER=3Dy<br /># CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set=
<br />CONFIG_DRM_FBDEV_EMULATION=3Dy<br />CONFIG_DRM_FBDEV_OVERALLOC=3D100<=
br /># CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM is not set<br /># CONFIG_DRM_LOAD_ED=
ID_FIRMWARE is not set<br /># CONFIG_DRM_DP_CEC is not set<br />CONFIG_DRM_=
GEM_CMA_HELPER=3Dy<br />CONFIG_DRM_KMS_CMA_HELPER=3Dy<br />CONFIG_DRM_VM=3D=
y<br /><br />#<br /># I2C encoder or helper chips<br />#<br /># CONFIG_DRM_=
I2C_CH7006 is not set<br /># CONFIG_DRM_I2C_SIL164 is not set<br />CONFIG_D=
RM_I2C_NXP_TDA998X=3Dm<br /># CONFIG_DRM_I2C_NXP_TDA9950 is not set<br /># =
end of I2C encoder or helper chips<br /><br /># ARM devices<br />#<br /># C=
ONFIG_DRM_HDLCD is not set<br /># CONFIG_DRM_MALI_DISPLAY is not set<br />#=
 CONFIG_DRM_KOMEDA is not set<br /># end of ARM devices<br /><br /># CONFIG=
_DRM_RADEON is not set<br /># CONFIG_DRM_AMDGPU is not set<br /># CONFIG_DR=
M_NOUVEAU is not set<br /># CONFIG_DRM_VGEM is not set<br /># CONFIG_DRM_VK=
MS is not set<br /># CONFIG_DRM_EXYNOS is not set<br /># CONFIG_DRM_UDL is =
not set<br /># CONFIG_DRM_AST is not set<br /># CONFIG_DRM_MGAG200 is not s=
et<br /># CONFIG_DRM_ARMADA is not set<br /># CONFIG_DRM_RCAR_DW_HDMI is no=
t set<br /># CONFIG_DRM_RCAR_LVDS is not set<br />CONFIG_DRM_OMAP=3Dm<br />=
CONFIG_OMAP2_DSS_INIT=3Dy<br />CONFIG_OMAP_DSS_BASE=3Dm<br />CONFIG_OMAP2_D=
SS=3Dm<br />CONFIG_OMAP2_DSS_DEBUG=3Dy<br />CONFIG_OMAP2_DSS_DEBUGFS=3Dy<br=
 />CONFIG_OMAP2_DSS_COLLECT_IRQ_STATS=3Dy<br />CONFIG_OMAP2_DSS_DPI=3Dy<br =
/>CONFIG_OMAP2_DSS_VENC=3Dy<br />CONFIG_OMAP2_DSS_HDMI_COMMON=3Dy<br />CONF=
IG_OMAP4_DSS_HDMI=3Dy<br />CONFIG_OMAP4_DSS_HDMI_CEC=3Dy<br />CONFIG_OMAP5_=
DSS_HDMI=3Dy<br /># CONFIG_OMAP2_DSS_SDI is not set<br /># CONFIG_OMAP2_DSS=
_DSI is not set<br />CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=3D0<br />CONFIG_OMAP2=
_DSS_SLEEP_AFTER_VENC_RESET=3Dy<br /><br />local.conf:<br /><br />MACHINE_E=
XTRA_RDEPENDS +=3D "ti-sgx-ddk-km"<br /><br />IMAGE_INSTALL_append =3D " ti=
-sgx-ddk-km ti-sgx-ddk-um libdrm libdrm-tests"<br /><br />DEPENDS_remove =
=3D "virtual/libgl"<br /><br />PREFERRED_PROVIDER_virtual/egl =3D "ti-sgx-d=
dk-um"<br />PREFERRED_PROVIDER_virtual/libgles1 =3D "ti-sgx-ddk-um"<br />PR=
EFERRED_PROVIDER_virtual/libgles2 =3D "ti-sgx-ddk-um"<br />PREFERRED_PROVID=
ER_virtual/libgbm =3D "ti-sgx-ddk-um"<br />PREFERRED_PROVIDER_virtual/gpudr=
iver =3D "ti-sgx-ddk-km"<br /><br /><br /><br />

--zDhN77pYHsU0H8wUtLGu--
